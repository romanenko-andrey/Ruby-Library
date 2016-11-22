module FileLib
    BASE_PATH = "./base/library"

    def load(source)
      File.open(BASE_PATH + '.' + source + '.dat') do |file|
        self.send(source + '=', Marshal.load(file) )
      end
    end

    def save(source)
      File.open(BASE_PATH + '.' + source + '.dat', 'w+') do |file|
        Marshal.dump(self.send(source), file)
      end
    end
end