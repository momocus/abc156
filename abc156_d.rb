
MOD = 1000000007

class Integer
  def factorial
    # 階乗 self!
    return 1 if self == 0
    (1..self).inject{|result,item|result * item % MOD}
  end

  def permutation(r)
    # 順列 selfPr
    return 1 if self == 0
    s = self - r + 1
    (s..self).inject{|result,item|result * item % MOD}
  end

  def combination(r)
    # 組み合わせselfCr
    r = [r, self - r].min
    return self if r == 1
    return 1 if r == 0
    self.permutation(r) * (r.factorial.inverse) % MOD
  end

  # selfのn乗
  def power(n)
    res = 1
    a = self
    while (n > 0)
      if n.odd?
        res = (res * a) % MOD
      end
      a = a * a % MOD
      n >>= 1 # n / 2
    end
    return res
  end

  def inverse
    # 逆元 self^{-1} mod を計算する
    return self.power(MOD-2)
  end
end


str = gets
nab = str.chomp.split(" ").map(&:to_i)
n = nab[0]
a = nab[1]
b = nab[2]

# 0本のときは花束にならないので-1
all = 2.power(n) - 1
rem1 = n.combination(a)
rem2 = n.combination(b)
total = (all - rem1 - rem2) % MOD
p total
