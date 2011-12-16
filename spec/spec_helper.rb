require 'rubygems'
require 'fileutils'

def run_local_command(cmd, &block)
  runtime = File.join(File.expand_path("../../", __FILE__), "tmp/runtime")
   
  FileUtils.mkdir_p(runtime)
  FileUtils.chdir(runtime) do 
    cmd_parts = cmd.split(' ')
    bin = cmd_parts.first
    args = cmd_parts[1..-1].join(' ')
    stdout_file = "stdout.txt"
    stderr_file = "stderr.txt"
    command = File.expand_path("../../bin/#{bin}", __FILE__) 
    `#{command} #{args} > #{stdout_file} 2> #{stderr_file}`
    result = $?.exitstatus

    stdout = IO.read(stdout_file)
    stderr = IO.read(stderr_file)

    yield(result,stdout,stderr) if block_given? 
    return([result,stdout,stderr])
  end
end
