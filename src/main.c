#include <u/u.h>

int main(int argc, const str_t argv[]) {
  u_die_if(!tb_init(nullptr, nullptr));

  uvec(str_t) v = nullptr;

  uv_init(v);

  uv_put(v, -1, "Hello");
  uv_put(v, -1, " ");
  uv_put(v, -1, "Template");
  uv_put(v, -1, "!");

  uv_foreach(v, ssize_t, i, str_t, s, {
    ;
    tb_tracef_i("%s", s);
  });

  tb_tracef_i("\n");

  uv_cleanup(v);

  tb_exit();
  return 0;
}
