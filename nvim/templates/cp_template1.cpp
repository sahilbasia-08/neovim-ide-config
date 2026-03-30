#include <iostream>
#include <vector>
#include <cstdio>

using namespace std;
typedef long long ll;
typedef vector<int> vec;

template <typename F>
constexpr void repeat(long a, long b, F&& func){
  for(long i=a; i<b; ++i){
    func(i);
  }
}
// to use this template 
// follow this example 
// repeat(0, 5, [](int i) {
//    std::cout << i << " ";
//});

template <typename T>
inline void read(T &x){
  x = 0;
  bool neg = false;
  char ch = getchar_unlocked();

  while(ch < '0' || ch > '9'){
    if(ch == '-') neg = true;
    ch = getchar_unlocked();
  }

  while(ch >= '0' && ch <= '9'){
    x = (x << 3) + (x << 1) + (ch - '0');
    ch = getchar_unlocked();
  }

  if (neg) x = -x;

}

void solve_codeforce(){
  return;
}

void solve_atcoder(){
  return;
}

int main(){
  // this will basically disable the sync with C styles stdio
  std::ios_base::sync_with_stdio(false);
  std::cin.tie(NULL);
  std::cout.tie(NULL);


  solve_codeforce();
  solve_atcoder();
  return 0;
}
