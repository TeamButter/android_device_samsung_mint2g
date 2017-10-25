#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <cutils/properties.h>
#include <sys/system_properties.h>
#include <android/log.h>

#define  LOG_TAG    "ext_symlink"
#define  LOGW(...)  __android_log_print(ANDROID_LOG_WARN, LOG_TAG, __VA_ARGS__)
#define  LOGE(...)  __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)


int setup_symlink(char *prop) {

	  char buffer[PROPERTY_VALUE_MAX];

	  int ret = property_get ( prop, buffer, NULL);
	  char * devpts = strtok (buffer, " \t");
	  char * devpty = strtok (NULL, " \t");

	  LOGW (" %d : %s=%s\n", ret, prop, buffer);

	  if (ret == 0) return -1;

	  if (unlink (devpty) == EACCES)
	    {
	      LOGE ("Cannot remove %s. Permission denied.", devpty);
	      return -1;
	    }

	  if (symlink (devpts, devpty)== EACCES)
	    {
	      LOGE ("Cannot create symlink. %s. Permission denied.", devpty);
	      return -1;
	    }
	  LOGW ("'%s' '%s'", devpty, devpts);
	  return 1;
}



int main (int argc, char *argv[]) {
  int timeout=120;
  char buf[4];
  if (strcmp (argv[1], "-p") == 0)
    {
      while(timeout--) {
      	property_get ("sys.symlink.notify", buf, NULL);
      	if (strcmp(buf, "1") == 0) {
      	setup_symlink("sys.symlink.pty");
      	property_set("sys.symlink.notify","0");
       }
      	sleep(1);
      }
	}

    
  else if (strcmp (argv[1], "-u") == 0)
    {
        setup_symlink("sys.symlink.umts_router");
      
    }

}
