// calculateWithAtomic.cpp

#include <atomic>
#include <chrono>
#include <iostream>
#include <numeric>
#include <random>
#include <vector>

constexpr long long size = 100000000;

int main(){
    std::cout << std::endl;

    std::vector<int> randValues;
    randValues.reserve(size);

    // random values
    std::random_device seed;
    std::mt19937 engine(seed());
    std::uniform_int_distribution<> uniformDist(1, 10);
    for (long long i = 0 ; i < size ; ++i)
    randValues.push_back(uniformDist(engine));

    std::atomic<unsigned long long> sum = {};
    std::cout << std::boolalpha << "sum.is_lock_free(): "
    << sum.is_lock_free() << std::endl;
    std::cout << std::endl;

    auto sta = std::chrono::steady_clock::now();

    for (auto i: randValues) sum += i;

    std::chrono::duration<double> dur =
    std::chrono::steady_clock::now() - sta;
    std::cout << "Time for addition " << dur.count()
    << " seconds" << std::endl;
    std::cout << "Result: " << sum << std::endl;

    std::cout << std::endl;

    sum=0;
    sta = std::chrono::steady_clock::now();

    for (auto i: randValues) sum.fetch_add(i);

    dur = std::chrono::steady_clock::now() - sta;
    std::cout << "Time for addition " << dur.count()
    << " seconds" << std::endl;
    std::cout << "Result: " << sum << std::endl;

    std::cout << std::endl;
}
