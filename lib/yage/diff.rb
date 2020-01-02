module Yage
  class Diff
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
        if @base.month < d2.month
          (full_month?(d2) ? 0 : -1) + d2.month - @base.month
        elsif @base.month == d2.month
          full_year?(d2) ? 0 : 11
        else
          (full_year?(d2) ? 0 : 12) + d2.month - @base.month
        end
      end

      def diff_mday(d2)
        d2.mday -
          @base.mday +
          (full_month?(d2) ? 0 : end_of_last_month(d2).mday)
      end

      def diff_yday(d2)
        d2.yday -
          @base.yday +
          (full_year?(d2) ? 0 : end_of_year(d2).yday) -
          (d2.leap? ? 1 : 0)
      end

      def full_year?(d2)
        @base.month < d2.month ||
          @base.month == d2.month && @base.mday <= d2.mday
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
