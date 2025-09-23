// aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
//
#include <atomic>
#include "test.hpp"
#include <iostream>

class Hoge
{
public:
    Hoge(int a) : m_a(a) {}
public:
    int getA() const { return m_a; }
private:
    int m_a;
};

// https://github.com/yohhoy/cpp-longest-identifier/wiki
bool longest_identifier()
{
    std::atomic<int> x(3);

    int expected = 3;
    const bool result = std::atomic_compare_exchange_strong_explicit(&x, &expected, 2,
                                                               std::memory_order_acquire,
                                                               std::memory_order_acquire);

    std::cout << std::boolalpha << result << " " << x.load() << " " << expected << std::endl;
    return result;
}

int main(int, const char**)
{
    Hoge hoge(42);
    longest_identifier();
    std::cout << hoge.getA() << std::endl;
    return 0;
}
