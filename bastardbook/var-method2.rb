require "open-uri"

remote_base_url = "http://en.wikipedia.org/wiki"
base_dir = './page'
r1 = "Steve_Wozniak"
r2 = "Steve_Jobs"
f1 = base_dir + "/my_copy_of-" + r1 + ".html"
f2 = base_dir + "/my_copy_of-" + r2 + ".html"

# read the first url
remote_full_url = remote_base_url + "/" + r1
rpage = open(remote_full_url).read

# write the first file to disk
file = open(f1, "w")
file.write(rpage)
file.close

# read the second url
remote_full_url = remote_base_url + "/" + r2
rpage = open(remote_full_url).read

# write the second file to disk
file = open(f2, "w")
file.write(rpage)
file.close

# open a new file:
compiled_file = open(base_dir + "/apple-guys.html", "w")

# reopen the first and second files again
k1 = open(f1, "r")
k2 = open(f2, "r")

compiled_file.write(k1.read)
compiled_file.write(k2.read)

k1.close
k2.close
compiled_file.close