_config()

bind(entity_damage, null, null, @e,

	if(@e['cause'] == "ENTITY_ATTACK" && @e['type'] != "PLAYER"){
	
		@prefix = "&c&l[ CHIM ]&f"
		@value = array_get(import(@e['id']), 0)
	
		if(@value && @value != @e['damager']){
		
			tmsg(@e['damager'], colorize(@prefix "해당 몹은 누군가가 먼저 데미지를 입혔기 때문에 공격할 수 없습니다"))
			cancel()
		
		}else{
		
			export(@e['id'], array(@e['damager'], add(time(), multiply(array_get(yml_decode(read("config.yml")), "expire-time"), 1000))))
		
		}
	
	}

)
