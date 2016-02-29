proc(_config,

	try(

		export("config.CHIM", yml_decode(read("config.yml")))
		
	  ,
		
		if(file_size("rsc/config.yml") == 0
			,die("[ CHIM ] Resource file was corrupted")
			,chd_write("config.yml", read("rsc/config.yml"));export("config.CHIM", yml_decode(read("config.yml"))))
			
	)

)
