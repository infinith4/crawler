# -*- coding: utf-8 -*-
urls = []
#urls.push("https://www.youtube.com/watch?v=ZaxGjgDrfBw&index=1&list=PL-bf6SGCYOlBNwx6iBOesS1pcDML0s_EQ")
#urls.push("https://www.youtube.com/watch?v=ows_18E1UD4&index=3&list=PL-bf6SGCYOlBNwx6iBOesS1pcDML0s_EQ")
urls.push("https://www.youtube.com/watch?v=HTaVGp83mak")

#urls.push("http://www.youtube.com/watch?v=-MfeittF-qI")

urls.each {|url|
	puts url
	system("youtube-dl -t #{url}")
}
