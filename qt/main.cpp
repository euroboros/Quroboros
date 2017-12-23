#include <iostream>

#include "widgets/mainwindow.h"
#include <QApplication>

#define USE_DEALII
#ifdef USE_DEALII
#include <deal.II/base/mpi.h>
#else
#include <mpi.h>
#endif
using namespace std;

int myId;
int noProcs;
char procName[MPI_MAX_PROCESSOR_NAME];
int nameLen;

int main(int argc, char *argv[])
{
#ifdef USE_DEALII
    using namespace dealii;
    Utilities::MPI::MPI_InitFinalize mpi_initialization(
      argc, argv,numbers::invalid_unsigned_int);

    std::cout<<"Deal.II used now"<<std::endl;
#else
    MPI_Init(&argc, &argv);
#endif

    int ret = EXIT_FAILURE;

    MPI_Comm_rank(MPI_COMM_WORLD, &myId);
    MPI_Comm_size(MPI_COMM_WORLD, &noProcs);
    MPI_Get_processor_name(procName, &nameLen);

    MPI_Barrier(MPI_COMM_WORLD);

    std::cout<<"in "<<noProcs<<" procs,";
    std::cout<<"I am "<<myId<<endl;

    if(myId==0)
    {
        cout<<"Master working on "<<myId<<endl;
        QApplication a(argc, argv);
        MainWindow w;
        w.show();
        ret = a.exec();
    }
    else
    {
        // operations of slave procs
        cout<<"Slave working on "<<myId<<endl;
    }

    MPI_Barrier(MPI_COMM_WORLD);
//    MPI_Finalize(); // coz Utilities::MPI::MPI_InitFinalize(...)  is used above

    return ret;
}
