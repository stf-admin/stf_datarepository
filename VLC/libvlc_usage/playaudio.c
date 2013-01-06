#include <stdio.h>
 #include <stdlib.h>
 #include <vlc/vlc.h>
 
 int main(int argc, char* argv[])
 {
     libvlc_instance_t * inst;
     libvlc_media_player_t *mp;
     libvlc_media_t *m;
     char const *vlcArgv[]={"--novideo"};//,"--plugin-path=/usr/include/vlc/plugins"};
     int vlc_argc = sizeof(vlcArgv) / sizeof(*vlcArgv);
     printf("%d\n",vlc_argc);
     if(argc != 2)
     {
	printf("Invalid Number of Arguments !!!\n");
	printf("please enter ---> ./a.out <filepath>\n");
	return -1;
     }
     /* Load the VLC engine */
     // inst = libvlc_new (vlc_argc, vlcArgv);
     inst = libvlc_new (0, NULL);
     /* Create a new item */
//     m = libvlc_media_new_path (inst, "/home/harisha/Music/ganesha_song.wma");
       m = libvlc_media_new_path (inst, argv[1]);
       
     /* Create a media player playing environement */
     mp = libvlc_media_player_new_from_media (m);
     
     /* No need to keep the media now */
     libvlc_media_release (m);
 
     /* play the media_player */
     libvlc_media_player_play (mp);
    
     sleep (60); /* Let it play a bit */
     /* Stop playing */
     libvlc_media_player_stop (mp);
 
     /* Free the media_player */
     libvlc_media_player_release (mp);
 
     libvlc_release (inst);
 
     return 0;
}

