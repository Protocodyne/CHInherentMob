/*    ____             __                       __               
     / __ \_________  / /_____  _________  ____/ /_  ______  ___ 
    / /_/ / ___/ __ \/ __/ __ \/ ___/ __ \/ __  / / / / __ \/ _ \
   / ____/ /  / /_/ / /_/ /_/ / /__/ /_/ / /_/ / /_/ / / / /  __/
  /_/   /_/   \____/\__/\____/\___/\____/\__,_/\__, /_/ /_/\___/ 
                                            /____/             
 ⓒ 2015 Protocodyne LLC, All Rights Reserved.
 본 코드의 모든 저작권은 Protocodyne 에 있으며
 무단 배포 하거나 영리적으로 사용하는것을 금합니다*/
 
_config()

bind(entity_damage, null, null, @e,

	if(@e['cause'] == "ENTITY_ATTACK" && @e['type'] != "PLAYER"){
	
		@prefix = "&c&l[ CHIM ]&f"
		@value = import(@e['id'])[0]
		@config = import("config.CHIM")
	
		if(@value && @value != @e['damager']){
		
			tmsg(@e['damager'], colorize(@prefix "해당 몹은 누군가가 먼저 데미지를 입혔기 때문에 공격할 수 없습니다"))
			cancel()
		
		}else{
		
			export(@e['id'], array(@e['damager'], add(time(), multiply(@config['expire-time'], 1000))))
		
		}
	
	}

)
