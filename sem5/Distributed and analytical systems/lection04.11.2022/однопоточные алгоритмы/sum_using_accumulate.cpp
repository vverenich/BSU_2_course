// calculateWithLoop.cpp

#include <chrono>
#include <iostream>
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

    const auto sta = std::chrono::steady_clock::now();

    unsigned long long sum = {};
    std::accumulate(randValues.begin(), randValues.end(), sum);

    const std::chrono::duration<double> dur = std::chrono::steady_clock::now() - sta;

    std::cout << "Time for addition " << dur.count()
    << " seconds" << std::endl;
    std::cout << "Result: " << sum << std::endl;

    std::cout << std::endl;
}
