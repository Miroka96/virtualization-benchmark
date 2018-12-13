#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <math.h>

void fork_child( long from,  long to, int * pipe);

long get_sum( long from,  long to)
{
    if (from == to)
    {
        return from;
    }
    else
    {
        int h_pipe[2];
        pipe(h_pipe);
        fork_child(from, (from + to) / 2, h_pipe);
        fork_child((from + to) / 2 + 1, to, h_pipe);
        long a, b;
        close(h_pipe[1]);
        FILE* read_pipe = fdopen(h_pipe[0], "r");
        wait(NULL);
        fscanf(read_pipe, "%ld", &a);
        wait(NULL);
        fscanf(read_pipe, "%ld", &b);
        close(h_pipe[0]);

        return a+b;
    }
}

void fork_child( long from,  long to, int * h_pipe)
{
    //printf("gettin sum from: %ld to %ld\n", from, to);
    int pid = fork();
    if(pid < 0){
        perror("fork failed");
        sleep(2);
        fork_child(from, to, h_pipe);
        //exit(EXIT_FAILURE);
    }
    else if (pid)
    {
        //parent
    }
    else
    {
        //child
        close(h_pipe[0]);
         long sum = get_sum(from, to);
        //printf("subproc sum:%ld\n", sum);
        close(1);
        dup(h_pipe[1]);
        printf("%ld \n", sum);
        //ffldsh(stdout);
        close(1);
        //close(h_pipe[1]);
        exit(0);
    }
}

int main(int argc, char const *argv[])
{
    /* code */
    int from = atoi(argv[1]);
    int to = atoi(argv[2]);
    printf("%d %d\n", from, to);
    long sum = get_sum(from, to);
    printf("finally %ld", sum);
    return 0;
}
