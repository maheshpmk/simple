function d = busdat
Slack=1;PV=2;PQ=3;
%     |Bus | Type | Vsp |del| PGi | QGi | PLi | QLi |
d = [   1   Slack  1.05   0    0     0     0     0;
        2    PQ    1.00   0    0     0    4.0   2.5;
        3    PV    1.04   0   2.0    0     0     0;];