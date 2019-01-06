require "open-uri"
base_dir = './page'

def createFile (base_dir,name)
  file = base_dir + "/my_copy_of-" + name + ".html"
  remote_base_url = "http://en.wikipedia.org/wiki"
  remote_full_url = remote_base_url + "/" + name
  read_page_data = open(remote_full_url).read
  file = open(file, "w")
  file.write(read_page_data)
  file.close
  return file
end

def compileFile (base_dir,name,file_1,file_2)
  # open a new file:
  compiled_file = open(base_dir +"/"+ name + ".html", "w")
  # reopen the first and second files again
  k1 = open(file_1, "r")
  k2 = open(file_2, "r")
  compiled_file.write(k1.read)
  compiled_file.write(k2.read)
  k1.close
  k2.close
  compiled_file.close
end

file_1 = createFile base_dir, "Steve_Wozniak"
file_2 = createFile base_dir, "Steve_Jobs"
compileFile base_dir, "apple-guy", file_1, file_2