module Yage
  class Diff
    Data = Struct.new(:base, :dist, :year, :month, :mday, :yday) do
      def to_s
        "#{year} year#{year > 1 ? "s" : ""}"
      end

      # format by following variable
      #   - %year
      #   - %month
      #   - %mday
      #   - %yday
      # ex) format("v%year.%month.%mday")
      def format(str, *args)
        str.gsub!(/%year/, year.to_s)
        str.gsub!(/%month/, month.to_s)
        str.gsub!(/%mday/, mday.to_s)
        str.gsub!(/%yday/, yday.to_s)
        sprintf str, *args
      end
    end

    def initialize(date = Date.today)
      @base = date
    end

    def diff(d2 = Date.today)
      return if d2 < @base

      Data.new(@base,
               d2,
               diff_year(d2),
               diff_month(d2),
               diff_mday(d2),
               diff_yday(d2))
    end

    private

      def diff_year(d2)
        d2.year - @base.year - (full_year?(d2) ? 0 : 1)
      end

      def diff_month(d2)
        if d2.month == @base.month
          full_year?(d2) ? 0 : 11
        else
          (full_year?(d2) ? 0 : 12) + d2.month - @base.month
        end
      end

      def diff_mday(d2)
        d2.mday - @base.mday + (full_month?(d2) ? 0 : end_of_last_month(d2).mday)
      end

      def diff_yday(d2)
        d2.yday -
          @base.yday +
          (full_year?(d2) ? 0 : end_of_year(d2).yday) -
          (d2.leap? ? 1 : 0)
      end

      def full_year?(d2)
        @base.month <= d2.month && @base.mday <= d2.mday
      end

      def end_of_year(d2)
        Date.new(d2.year, 12, 31)
      end

      def full_month?(d2)
        @base.mday <= d2.mday
      end

      def end_of_last_month(d2)
        Date.new(d2.year, d2.month - 1, -1)
      end
  end
end
