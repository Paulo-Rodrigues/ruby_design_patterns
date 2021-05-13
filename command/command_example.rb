require 'fileutils'

class Command
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def execute
    raise NotImplementedError
  end
end

class CreateFileCommand < Command
  def initialize(path, content)
    super("Create file: #{path}")
    @path = path
    @content = content
  end

  def execute
    file = File.open(@path, 'w')
    file.write(@content)
    file.close
  end
end

class DeleteFileCommand < Command
  def initialize(path)
    super("Delete file #{path}")
    @path = path
  end

  def execute
    File.delete(@path)
  end
end

class CopyFileCommand < Command
  def initialize(source, target)
    super("Copy file: #{source} to #{target}")
    @source = source
    @target = target
  end

  def execute
    FileUtils.copy(@source, @target)
  end
end
