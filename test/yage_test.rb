require "test_helper"
require "date"

class YageTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Yage::VERSION
  end

  def test_1
    d = Yage::Diff.new(Date.parse('2018/04/10'))
    res = d.diff(Date.parse('2018/04/10'))
    assert_equal 0, res.year
    assert_equal 0, res.month
    assert_equal 0, res.mday
    assert_equal 0, res.yday
  end

  def test_2
    d = Yage::Diff.new(Date.parse('2018/04/10'))
    res = d.diff(Date.parse('2018/04/11'))
    assert_equal 0, res.year
    assert_equal 0, res.month
    assert_equal 1, res.mday
    assert_equal 1, res.yday
  end

  def test_3
    d = Yage::Diff.new(Date.parse('2018/04/10'))
    res = d.diff(Date.parse('2018/05/10'))
    assert_equal 0,  res.year
    assert_equal 1,  res.month
    assert_equal 0,  res.mday
    assert_equal 30, res.yday
  end

  def test_4
    d = Yage::Diff.new(Date.parse('2018/04/10'))
    res = d.diff(Date.parse('2019/04/09'))
    assert_equal 0,   res.year
    assert_equal 11,  res.month
    assert_equal 30,  res.mday
    assert_equal 364, res.yday
  end

  def test_5
    d = Yage::Diff.new(Date.parse('2018/04/10'))
    res = d.diff(Date.parse('2019/04/10'))
    assert_equal 1, res.year
    assert_equal 0, res.month
    assert_equal 0, res.mday
    assert_equal 0, res.yday
  end

  def test_6
    d = Yage::Diff.new(Date.parse('2018/04/10'))
    res = d.diff(Date.parse('2019/04/11'))
    assert_equal 1, res.year
    assert_equal 0, res.month
    assert_equal 1, res.mday
    assert_equal 1, res.yday
  end

  def test_7
    d = Yage::Diff.new(Date.parse('2018/04/10'))
    res = d.diff(Date.parse('2019/05/09'))
    assert_equal 1, res.year
    assert_equal 0, res.month
    assert_equal 29, res.mday
    assert_equal 29, res.yday
  end

  def test_8
    d = Yage::Diff.new(Date.parse('2018/04/10'))
    res = d.diff(Date.parse('2020/02/29'))
    assert_equal 1,   res.year
    assert_equal 10,  res.month
    assert_equal 19,  res.mday
    assert_equal 325, res.yday
  end

  def test_9
    d = Yage::Diff.new(Date.parse('2018/03/01'))
    res = d.diff(Date.parse('2019/02/28'))
    assert_equal 0,   res.year
    assert_equal 11,  res.month
    assert_equal 27,  res.mday
    assert_equal 364, res.yday
  end

  def test_10
    d = Yage::Diff.new(Date.parse('2018/03/01'))
    res = d.diff(Date.parse('2020/02/29'))
    assert_equal 1,   res.year
    assert_equal 11,  res.month
    assert_equal 28,  res.mday
    assert_equal 365, res.yday
  end

  def test_11
    d = Yage::Diff.new(Date.parse('2018/01/02'))
    res = d.diff(Date.parse('2020/01/01'))
    assert_equal 1,   res.year
    assert_equal 11,  res.month
    assert_equal 30,  res.mday
    assert_equal 364, res.yday
  end
end
