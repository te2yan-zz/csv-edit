if ARGV[0].nil? then
  puts 'Usage: csv-edit <csv_file>'
  exit
end

srcfile = ARGV[0]
dir, file = File::split(srcfile)
dstname = File.basename(file,'.*') + '_ret' + File.extname(file)
dstfile = File.join(dir, dstname)
buffer=""

File.open(srcfile) do |file|
  file.each_line do |line|
    if line.start_with?("#") then
    # コメントの場合
      if line.include?("Agent") then
        line.slice!(0)
      end
    else
    # コメントではない場合
    end
    buffer += line
  end
end

File.write(dstfile, buffer)
