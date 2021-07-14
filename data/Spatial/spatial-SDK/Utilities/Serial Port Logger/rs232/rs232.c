/*
***************************************************************************
*
* Author: Teunis van Beelen
*
* Copyright (C) 2005, 2006, 2007, 2008, 2009 Teunis van Beelen
*
* teuniz@gmail.com
*
***************************************************************************
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation version 2 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with this program; if not, write to the Free Software Foundation, Inc.,
* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*
***************************************************************************
*
* This version of GPL is at http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
*
***************************************************************************
*/



#include "rs232.h"



#ifdef __linux__   /* Linux */


int Cport,
    error;

struct termios new_port_settings,
       old_port_settings;

int OpenComport(char *comport, int baudrate)
{
  int baudr;

  switch(baudrate)
  {
    case      50 : baudr = B50;
                   break;
    case      75 : baudr = B75;
                   break;
    case     110 : baudr = B110;
                   break;
    case     134 : baudr = B134;
                   break;
    case     150 : baudr = B150;
                   break;
    case     200 : baudr = B200;
                   break;
    case     300 : baudr = B300;
                   break;
    case     600 : baudr = B600;
                   break;
    case    1200 : baudr = B1200;
                   break;
    case    1800 : baudr = B1800;
                   break;
    case    2400 : baudr = B2400;
                   break;
    case    4800 : baudr = B4800;
                   break;
    case    9600 : baudr = B9600;
                   break;
    case   19200 : baudr = B19200;
                   break;
    case   38400 : baudr = B38400;
                   break;
    case   57600 : baudr = B57600;
                   break;
    case  115200 : baudr = B115200;
                   break;
    case  230400 : baudr = B230400;
                   break;
    case  460800 : baudr = B460800;
                   break;
    case  500000 : baudr = B500000;
                   break;
    case  576000 : baudr = B576000;
                   break;
    case  921600 : baudr = B921600;
                   break;
    case 1000000 : baudr = B1000000;
                   break;
    default      : printf("invalid baudrate\n");
                   return(1);
                   break;
  }

  Cport = open(comport, O_RDWR | O_NOCTTY | O_NDELAY);
  if(Cport==-1)
  {
    perror("unable to open comport ");
    return(1);
  }

  error = tcgetattr(Cport, &old_port_settings);
  if(error==-1)
  {
    close(Cport);
    perror("unable to read portsettings ");
    return(1);
  }
  memset(&new_port_settings, 0, sizeof(new_port_settings));  /* clear the new struct */

  new_port_settings.c_cflag = baudr | CS8 | CLOCAL | CREAD;
  new_port_settings.c_iflag = IGNPAR;
  new_port_settings.c_oflag = 0;
  new_port_settings.c_lflag = 0;
  new_port_settings.c_cc[VMIN] = 0;      /* block untill n bytes are received */
  new_port_settings.c_cc[VTIME] = 0;     /* block untill a timer expires (n * 100 mSec.) */
  error = tcsetattr(Cport, TCSANOW, &new_port_settings);
  if(error==-1)
  {
    close(Cport);
    perror("unable to adjust portsettings ");
    return(1);
  }

  return(0);
}


int PollComport(unsigned char *buf, int size)
{
  int n;

#ifndef __STRICT_ANSI__                       /* __STRICT_ANSI__ is defined when the -ansi option is used for gcc */
  if(size>SSIZE_MAX)  size = (int)SSIZE_MAX;  /* SSIZE_MAX is defined in limits.h */
#else
  if(size>4096)  size = 4096;
#endif

  n = read(Cport, buf, size);

  return(n);
}


int SendByte(unsigned char byte)
{
  int n;

  n = write(Cport, &byte, 1);
  if(n<0)  return(1);

  return(0);
}


int SendBuf(unsigned char *buf, int size)
{
  return(write(Cport, buf, size));
}


void CloseComport()
{
  close(Cport);
  tcsetattr(Cport, TCSANOW, &old_port_settings);
}

/*
Constant  Description
TIOCM_LE  DSR (data set ready/line enable)
TIOCM_DTR DTR (data terminal ready)
TIOCM_RTS RTS (request to send)
TIOCM_ST  Secondary TXD (transmit)
TIOCM_SR  Secondary RXD (receive)
TIOCM_CTS CTS (clear to send)
TIOCM_CAR DCD (data carrier detect)
TIOCM_CD  Synonym for TIOCM_CAR
TIOCM_RNG RNG (ring)
TIOCM_RI  Synonym for TIOCM_RNG
TIOCM_DSR DSR (data set ready)
*/

int IsCTSEnabled(int comport_number)
{
  int status;

  status = ioctl(Cport, TIOCMGET, &status);

  if(status&TIOCM_CTS) return(1);
  else return(0);
}


#else         /* windows */


HANDLE Cport;

char baudr[64];


int OpenComport(char *comport, int baudrate)
{
  DCB port_settings;
  COMMTIMEOUTS Cptimeouts;
  
  char comport_path[32];
  sprintf(comport_path, "\\\\.\\%s", comport);

  switch(baudrate)
  {
    case     110 : strcpy(baudr, "baud=110 data=8 parity=N stop=1");
                   break;
    case     300 : strcpy(baudr, "baud=300 data=8 parity=N stop=1");
                   break;
    case     600 : strcpy(baudr, "baud=600 data=8 parity=N stop=1");
                   break;
    case    1200 : strcpy(baudr, "baud=1200 data=8 parity=N stop=1");
                   break;
    case    2400 : strcpy(baudr, "baud=2400 data=8 parity=N stop=1");
                   break;
    case    4800 : strcpy(baudr, "baud=4800 data=8 parity=N stop=1");
                   break;
    case    9600 : strcpy(baudr, "baud=9600 data=8 parity=N stop=1");
                   break;
    case   19200 : strcpy(baudr, "baud=19200 data=8 parity=N stop=1");
                   break;
    case   38400 : strcpy(baudr, "baud=38400 data=8 parity=N stop=1");
                   break;
    case   57600 : strcpy(baudr, "baud=57600 data=8 parity=N stop=1");
                   break;
    case  115200 : strcpy(baudr, "baud=115200 data=8 parity=N stop=1");
                   break;
    case  128000 : strcpy(baudr, "baud=128000 data=8 parity=N stop=1");
                   break;
	case  230400 : strcpy(baudr, "baud=230400 data=8 parity=N stop=1");
                   break;
    case  256000 : strcpy(baudr, "baud=256000 data=8 parity=N stop=1");
                   break;
	case  460800 : strcpy(baudr, "baud=460800 data=8 parity=N stop=1");
                   break;
	case  500000 : strcpy(baudr, "baud=500000 data=8 parity=N stop=1");
                   break;
	case  921600 : strcpy(baudr, "baud=921600 data=8 parity=N stop=1");
                   break;
	case 1000000 : strcpy(baudr, "baud=1000000 data=8 parity=N stop=1");
                   break;
    default      : printf("invalid baudrate\n");
                   return(1);
                   break;
  }

  Cport = CreateFileA(comport_path,
                      GENERIC_READ|GENERIC_WRITE,
                      0,                          /* no share  */
                      NULL,                       /* no security */
                      OPEN_EXISTING,
                      0,                          /* no threads */
                      NULL);                      /* no templates */

  if(Cport==INVALID_HANDLE_VALUE)
  {
    printf("unable to open comport\n");
    return(1);
  }

  
  memset(&port_settings, 0, sizeof(port_settings));  /* clear the new struct  */
  port_settings.DCBlength = sizeof(port_settings);

  if(!BuildCommDCBA(baudr, &port_settings))
  {
    printf("unable to set comport dcb settings\n");
    CloseHandle(Cport);
    return(1);
  }

  if(!SetCommState(Cport, &port_settings))
  {
    printf("unable to set comport cfg settings\n");
    CloseHandle(Cport);
    return(1);
  }

  Cptimeouts.ReadIntervalTimeout         = MAXDWORD;
  Cptimeouts.ReadTotalTimeoutMultiplier  = 0;
  Cptimeouts.ReadTotalTimeoutConstant    = 0;
  Cptimeouts.WriteTotalTimeoutMultiplier = 0;
  Cptimeouts.WriteTotalTimeoutConstant   = 0;

  if(!SetCommTimeouts(Cport, &Cptimeouts))
  {
    printf("unable to set comport time-out settings\n");
    CloseHandle(Cport);
    return(1);
  }

  return(0);
}


int PollComport(unsigned char *buf, int size)
{
  int n;

  if(size>4096)  size = 4096;

/* added the void pointer cast, otherwise gcc will complain about */
/* "warning: dereferencing type-punned pointer will break strict aliasing rules" */

  ReadFile(Cport, buf, size, (LPDWORD)((void *)&n), NULL);

  return(n);
}


int SendByte(unsigned char byte)
{
  int n;

  WriteFile(Cport, &byte, 1, (LPDWORD)((void *)&n), NULL);

  if(n<0)  return(1);

  return(0);
}


int SendBuf(unsigned char *buf, int size)
{
  int n;

  if(WriteFile(Cport, buf, size, (LPDWORD)((void *)&n), NULL))
  {
    return(n);
  }

  return(-1);
}


void CloseComport()
{
  CloseHandle(Cport);
}


int IsCTSEnabled()
{
  int status;

  GetCommModemStatus(Cport, (LPDWORD)((void *)&status));

  if(status&MS_CTS_ON) return(1);
  else return(0);
}


#endif

