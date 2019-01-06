require "open-uri"
base_dir = './page'

start_year = 1990
end_year = 1996

remote_url = "http://en.wikipedia.org/wiki"

# (start_year..end_year).each do |year|
#   read_page = open(remote_url + '/' + year.to_s)
#   local_fname = base_dir + "/copy-of-" + year.to_s + ".html"
#   local_file = open(local_fname, "w")
#   local_file.write(read_page.read)
#   local_file.close
#   puts "wrote file " + local_fname
#   sleep 1
# end

# compiled_file = open(start_year.to_s + "-" + end_year.to_s + ".html", "w")

# (start_year..end_year).each do |year|
#   local_fname = base_dir + "/copy-of-" + year.to_s + ".html"
#   local_file = open(local_fname, "r")
#   compiled_file.write(local_file.read)
#   local_file.close
# end
# compiled_file.close

compiled_file = open(base_dir + '/' + start_year.to_s + "-" + end_year.to_s + ".html", "w")
(start_year..end_year).each do |year|
  rpage_data = open(remote_url + '/' + year.to_s).read
  compiled_file.write(rpage_data)

  local_fname = base_dir + "/copy-of-" + year.to_s + ".html"
  local_file = open(local_fname, "w")
  local_file.write(rpage_data)
  local_file.close
  puts "wrote file " + local_fname
  # sleep 1
end
compiled_file.close