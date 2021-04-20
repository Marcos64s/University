/*
    O talker lê a mensagem e faz um send() para a fila de mensagens
*/

#include "comm.h"
#include "message.h"

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <errno.h>
#include <string.h>

#define MSG_KEY1 0x1111UL
#define MSG_KEY2 0x1112UL

static struct cont 
{
    long client;
    char msg[100];
} container;


static int csQueue,              /* client-server message queue */
           scQueue;              /* server-client message queue */


int openComm(void)
{

}

void send(char *msg)
{
    container.client = getpid();
}






int main(int argc, char *argv[])
{
    char str1[100];
    openComm(0x100);

    while(1) {
        scanf("%[^\n]%*c",str1);
        send(str1);
    }
    return 0;
}