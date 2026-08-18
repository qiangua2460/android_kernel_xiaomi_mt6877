#ifndef _TCP_PLB_STUB_H_
#define _TCP_PLB_STUB_H_

#include <net/tcp_plb.h>
#include <net/tcp.h>

static inline void tcp_plb_update_state(struct sock *sk, struct tcp_plb_state *plb, int ce_ratio) {}
static inline void tcp_plb_check_rehash(struct sock *sk, struct tcp_plb_state *plb) {}
static inline void tcp_plb_update_state_upon_rto(struct sock *sk, struct tcp_plb_state *plb) {}

#endif /* _TCP_PLB_STUB_H_ */
