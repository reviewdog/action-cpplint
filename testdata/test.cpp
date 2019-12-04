// aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
//
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

int main(int, const char**)
{
    Hoge hoge(42);
    std::cout << hoge.getA() << std::endl;
    return 0;
}
