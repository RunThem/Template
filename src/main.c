#define u_vec_defs u_defs(vec, u_cstr_t)
#include <u/u.h>

int main(int argc, const u_cstr_t argv[]) {
  u_vec_t(u_cstr_t) v = nullptr;

  u_vec_init(v);

  u_vec_put(v, "Hello");
  u_vec_put(v, " ");
  u_vec_put(v, -1, "Template");
  u_vec_put(v, -1, "!");

  u_vec_for(v, i, s) {
    printf("%s", s);
  }

  printf("\n");

  u_vec_cleanup(v);

  return 0;
}
