#include <iostream>

using namespace std;

extern "C" int GetValueASM(int a);

int main() {
    cout << "ASM gerou " << GetValueASM(32) << endl;
    return 0;
}