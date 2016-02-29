/*    ____             __                       __               
     / __ \_________  / /_____  _________  ____/ /_  ______  ___ 
    / /_/ / ___/ __ \/ __/ __ \/ ___/ __ \/ __  / / / / __ \/ _ \
   / ____/ /  / /_/ / /_/ /_/ / /__/ /_/ / /_/ / /_/ / / / /  __/
  /_/   /_/   \____/\__/\____/\___/\____/\__,_/\__, /_/ /_/\___/ 
                                            /____/             
 ⓒ 2015 Protocodyne LLC, All Rights Reserved.
 본 코드의 모든 저작권은 Protocodyne 에 있으며
 무단 배포 하거나 영리적으로 사용하는것을 금합니다*/

proc(_config,

	try(

		export("config.CHIM", yml_decode(read("config.yml")))
		
	  ,
		
		if(file_size("rsc/config.yml") == 0
			,die("[ CHIM ] Resource file was corrupted")
			,chd_write("config.yml", read("rsc/config.yml"));export("config.CHIM", yml_decode(read("config.yml"))))
			
	)

)
