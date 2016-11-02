#include <string.h>
#include <unistd.h>

#include <cutils/properties.h>
#include <cutils/log.h>
//#define LOG_TAG		"ATChannel"
#define MAX_LEN		128

#define TARGET_PROP	"sys.symlink.pty"
#define NOTIFY_PROP	"sys.symlink.notify"

#define COUNT		16

void string_detach(char* key, char* store[]) {
	int i, count = 0, xcount = 0;
	for(i = 0; key[i] != '\0'; i++) {
		if(key[i] == ' ') {
			store[count][xcount] = '\0';
			count++;
			xcount = 0;			
		}
		store[count][xcount] = key[i];
	}
	store[count][xcount] = '\0';
}

int main() {
	char prop_buf[MAX_LEN];
	char old_buf[MAX_LEN] = "";
	
	char store[4][MAX_LEN];
	
	int count = 0;
	
	int flag = 0;
	
	ALOGI("Creating symlinks...");
	
	while(count < COUNT) {
		property_get(TARGET_PROP,prop_buf,"");
		if(strcmp(prop_buf, old_buf)) {
			ALOGI("Linking %s", prop_buf);
			strcpy(old_buf,prop_buf);
			string_detach(prop_buf,store);
			symlink(store[0],store[1]);
			property_set(NOTIFY_PROP,"0");
			count++;
		}
		
	}
	
	ALOGI("Done creating symlinks");
	
	return 0;
}
