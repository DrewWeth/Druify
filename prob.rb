h_count = 0
l_count = 0



while true
	puts "enter the bots: "
	input = gets.chomp
	if Integer(input) <= 3
		l_count += 1
	else 
		h_count += 1
	end


	puts "low count: " + l_count.to_s + ". High count: " + h_count.to_s

	if l_count <= h_count
		puts "CHOOSE LOW"
	else
		puts "CHOOSE HIGH"
	end

	
end
