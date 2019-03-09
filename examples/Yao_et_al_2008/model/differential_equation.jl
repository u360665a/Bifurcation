function diffeq(u::Vector)
    du = similar(u);

    du[M] = p[kM]*p[S]/(p[KS]+p[S]) - p[dM]*u[M];
    du[E] = p[kE]*(u[M]/(p[KM]+u[M]))*(u[E]/(p[KE]+u[E])) + p[kb]*u[M]/(p[KM]+u[M]) +
            p[kP1]*u[CD]*u[RE]/(p[KCD]+u[RE]) + p[kP2]*u[CE]*u[RE]/(p[KCE]+u[RE]) - p[dE]*u[E]-p[kRE]*u[R]*u[E];
    du[CD] = p[kCD]*u[M]/(p[KM]+u[M]) + p[kCDS]*p[S]/(p[KS]+p[S]) - p[dCD]*u[CD];
    du[CE] = p[kCE]*u[E]/(p[KE]+u[E]) - p[dCE]*u[CE];
    du[R] = p[kR] + p[kDP]*u[RP]/(p[KRP]+u[RP]) - p[kRE]*u[R]*u[E] - p[kP1]*u[CD]*u[R]/(p[KCD]+u[R]) -
            p[kP2]*u[CE]*u[R]/(p[KCE]+u[R]) - p[dR]*u[R];
    du[RP] = p[kP1]*u[CD]*u[R]/(p[KCD]+u[R]) + p[kP2]*u[CE]*u[R]/(p[KCE]+u[R]) + p[kP1]*u[CD]*u[RE]/(p[KCD]+u[RE]) +
             p[kP2]*u[CE]*u[RE]/(p[KCE]+u[RE]) - p[kDP]*u[RP]/(p[KRP]+u[RP]) - p[dRP]*u[RP];
    du[RE] = p[kRE]*u[R]*u[E]-p[kP1]*u[CD]*u[RE]/(p[KCD]+u[RE]) - p[kP2]*u[CE]*u[RE]/(p[KCE]+u[RE]) - p[dRE]*u[RE];

    return du
end