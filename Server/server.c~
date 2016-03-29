#include <stdio.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define BUF_SIZE 500
/*
struct sockaddr_in {
    short            sin_family;   // e.g. AF_INET
    unsigned short   sin_port;     // e.g. htons(3490)
    struct in_addr   sin_addr;     // see struct in_addr, below
    char             sin_zero[8];  // zero this if you want to
};

struct in_addr {
    unsigned long s_addr;  // load with inet_aton()
};


*/



// First argument given when you execute the program is the port you want to connect to
int main(int argc, char* argv[]){
	int sock = socket(AF_INET,SOCK_STREAM,IPPROTO_TCP);
	if(sock == -1){
		printf("Error : couldn't create the socket !");
		return 0;
	}

	struct sockaddr_in addr;
	addr.sin_port = htons(atoi(argv[2]));
	addr.sin_addr.s_addr = INADDR_ANY;
	socklen_t peer_addr_size = sizeof(struct sockaddr_in);
	char buf[BUF_SIZE];

	if(bind(sock,(struct sockaddr*) &addr, sizeof(struct sockaddr_in)) == -1){
		printf("Error : couldn't bind the socket and the adress !");
		return 0;
	}
	if(listen(sock,64) == -1){
		printf("Error : sock is deaf and cannot listen !");
		return 0;
	}

	while(1){
		if(accept(sock, (struct sockaddr *) &addr, &peer_addr_size)==-1){
			printf("Error : couldn't accept request, or no request to accept.");
		}
		recv(sock,buf,BUF_SIZE,0);
		printf("%s", inet_ntoa(addr.sin_addr));
		send(sock,buf,BUF_SIZE,0);
	}


	return 0;
}
