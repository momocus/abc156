class MemoisdCombi
  @fac
  @finv
  @inv
  @modulo

  def initialize(max, mod)
    @modulo = mod
    @fac = Array.new(max)
    @finv = Array.new(max)
    @inv = Array.new(max)

    @fac[0] = @fac[1] = 1
    @finv[0] = @finv[1] = 1
    @inv[1] = 1
    for i in 2..max - 1
      @fac[i] = @fac[i - 1] * i % @modulo
      @inv[i] = @modulo - @inv[@modulo % i] * (@modulo / i) % @modulo
      @finv[i] = @finv[i - 1] * @inv[i] % @modulo
    end
  end

  def combination(n, k)
    return 0 if (n < k)
    return 0 if (n < 0 || k < 0)
    return @fac[n] * (@finv[k] * @finv[n - k] % @modulo) % @modulo
  end
end

# n: 部屋数 (3≤n≤2×10^5)
# k: 移動回数(2≤k≤10^9)

# res: 組み合わせ数
# 重複あり組み合わせ
# n人がn部屋にいるときの組み合わせ総数
modulo = 1000000007
max = 200001

str = gets
n, k = str.chomp.split(" ").map(&:to_i)
ary = Array.new(n)

mc = MemoisdCombi.new(max, modulo)

result = 0
roop_num = [n, k].min

(0..roop_num).each do |m|
  # m: 誰もいない部屋の数
  a = mc.combination(n, m) # nCm
  b = mc.combination(n - 1, m) # n-mHm
  result = (result + (a * b % modulo)) % modulo
end

p result
