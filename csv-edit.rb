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
    # �R�����g�̏ꍇ
      if line.include?("Agent") then
        line.slice!(0)
      end
    else
    # �R�����g�ł͂Ȃ��ꍇ
    end
    buffer += line
  end
end

File.write(dstfile, buffer)
