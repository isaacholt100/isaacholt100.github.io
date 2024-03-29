#import "../../template.typ": template
#show: template

#let hbar = $planck.reduce$
#let ip(a, b) = $angle.l #a, #b angle.r$
#let ket(arg) = $lr(| arg angle.r)$
#let bra(arg) = $lr(angle.l arg |)$
#let braket(..args) = $lr(angle.l #args.pos().join("|") angle.r)$
#let conj(arg) = $arg^*$
#let expected(arg) = $angle.l arg angle.r$
#let vd(vector) = $bold(vector)$
#let End = $"End"$
#let tp = $times.circle$ // tensor product

= Quantum mechanics essentials

- A particle's position on the real line is given by a wave function $psi(x, t) -> CC$.
- Probability of finding particle in $(a, b)$ is $ P(a, b; t) = integral_a^b |psi(x, t)|^2 dif x $ Wave function is normalised so that $P(-oo, +oo; t) = 1$.
- Time-evolution of wave function given by *Schrodinger equation*: $ i hbar (diff psi(x, t)) / (diff t) = -hbar^2 / (2m) diff^2 / (diff x^2) psi(x, t) + V(x) psi(x, t) = hat(H) psi(x, t) $ where $hat(H) = hat(K) + hat(V)$ is the Hamiltonian operator, $hat(K)$ is kinetic energy operator, $hat(V)$ is potential energy operator.
- Schrodinger equation is *linear*, so any linear combination of solutions is another solution (*principle of superposition*).
- An inner product is defined on the space of solutions to the Schrodinger equation: $ ip(psi, phi) = integral_(-oo)^oo psi^*(x, t) phi(x, t) dif x $
- *Hilbert space*: (complex) vector space with Hermitian inner product that is also a complete metric space with metric induced by the inner product:
    - $ip(psi, a phi_1 + b phi_2) = a ip(psi, phi_1) + b ip(psi, phi_2)$
    - $ip(psi, phi) = ip(phi, psi)^*$
- *Dirac notation*:
    - Write $ket(psi)$ (a *ket*) for vector in Hilbert space $cal(H)$ corresponding to wave function $psi$.
    - Write $bra(phi)$ (a *bra*) for *dual* vector in $cal(H)^*$.
    - *bra-ket*: $ braket(phi, psi) := ip(phi, psi) = integral_(-oo)^oo phi^* (x, t) psi(x, t) dif x $
- *Dual* of vector space $V$ is set of linear functionals from $V$ to $CC$: $ V^* := {Phi: V -> CC: forall (a, b) in CC^2, forall (z, w) in V^2, quad Phi(a vd(z) + b vd(w)) = a Phi(vd(z)) + b Phi(vd(w)) } $ We have $dim(V^*) = dim(V)$.
- If $V = CC^n$, can think of vectors in $V$ as $n times 1$ matrices and vectors in $V^*$ as $1 times n$ matrices.
- A quantum mechanical system is described by a ket $ket(psi)$ in Hilbert space $cal(H)$. For all $ket(psi), ket(phi) in cal(H)$:
    - $forall (a, b) in CC^2, a ket(psi) + b ket(phi) in cal(H)$
    - Inner product of $ket(psi)$ with $ket(phi)$ is a complex number written as $braket(psi, phi)$. It is Hermitian: $braket(psi, phi) = braket(phi, psi)^*$.
    - Inner product is *sesquilinear* (linear in the second factor, anti-linear in the first). For $ket(phi) = c_1 ket(phi_1) + c_2 ket(phi_2)$:
    $ braket(psi, phi) & = c_1 braket(psi, phi_1) + c_2 braket(psi, phi_2) \ braket(phi, psi) & = c_1^* braket(phi_1, psi) + c_2^* braket(phi_2, psi) $
    - $braket(psi, psi) >= 0$ and $braket(psi, psi) = 0 <==> ket(psi) = 0$.
    - States which differ by only a normalisation factor are physically equivalent: $ forall c in CC^*, quad ket(psi) tilde.op c ket(psi) $ For this reason, pure quantum mechanical states are called *rays* in the Hilbert space, and we normally assume that a state $ket(psi)$ has norm $1$: $norm(ket(psi)) = 1$.
- *Physical state* condition: $braket(psi, psi) >= 0$ and $braket(psi, psi) = 0 <==> ket(psi) = 0$.
- Note that the state labelled zero, $ket(0)$, is not equal to the zero state (the $0$ vector).
- If $hat(A)$ is linear opearator then $hat(A) (a ket(psi) + b ket(phi)) = a \(hat(A) ket(psi)\) + b \(hat(A) ket(phi)\)$
- Products and combinations of linear operators are also linear operators.
- *Adjoint (Hermitian conjugate)* of $hat(A)$, $hat(A)^dagger$ is defined by $ bra(psi) (hat(A)^dagger ket(phi)) = conj((bra(phi) (hat(A) ket(psi)))) $
- $hat(A)$ is *self-adjoint (Hermitian)* if $hat(H)^dagger = hat(H)$. Self-adjoint operators correspond to *observables* (measurable quantities) since they have real eigenvalues. Similarly, a *hermitian matrix* $H$ satisfies $H^dagger = (H^T)^* = H$.
- $hat(U)$ is *unitary* if $hat(U)^dagger hat(U) = hat(I)$. Unitary operators describe time-evolution in quantum mechanics. Similarly, a unitary matrix $U$ satisfies $U^dagger U = U U^dagger = I$.
- *Commutator* of operators $hat(A)$ and $hat(B)$: $ \[hat(A), hat(B)\] = hat(A) hat(B) - hat(B) hat(A) $
- *Anti-commutator*: $ \{hat(A), hat(B)\} = hat(A) hat(B) + hat(B) hat(A) $
- *Expectation value* of observable $hat(A)$ on state $ket(psi)$: $ expected(A)_psi := braket(psi, hat(A), psi) $ Interpreted as average outcome of many measurements of $hat(A)$ on same state $ket(psi)$.
- If we have $braket(n, m) = delta_(n m)$, the basis is orthonormal.
- *Qubit system*: Hilbert space $cal(H) = "span"(ket(0), ket(1))$. Any $ket(psi) in cal(H)$ can be written as $a_0 ket(0) + a_1 ket(1)$. If $ket(phi) = b_0 ket(0) + b_1 ket(1)$, $ braket(phi, psi) & = (b_0^* bra(0) + b_1^* ket(1))(a_0 ket(0) + a_1 ket(1)) \ & = conj(b_0) a_0 braket(0, 0) + conj(b_1) a_1 braket(1, 1) + conj(b_0) a_1 braket(0, 1) + conj(b_1) a_0 braket(1, 0) = conj(b_0) a_0 + conj(b_1) a_0 \ & = mat(conj(b_0), conj(b_1)) mat(1, 0; 0, 1) mat(a_0; a_1) $ If $ket(0), ket(1)$ is an energy eigenbasis, then $hat(H) ket(0) = E_0 ket(0)$ and $hat(H) ket(1) = E_1 ket(1)$ where $E_0, E_1$ are eigenvalues. $PP("measuring " E_0) = a_0^2 = |braket(0, psi)|^2, PP("measuring " E_1) = a_1^2 = |braket(1, psi)|^2$. If $a_0^2 + a_1^2 = 1$, then $braket(psi, psi) = 1$ so $psi$ is normalised. The expected energy measurement is $expected(E) = E_0 |a_0|^2 + E_1 |a_1|^2$.
- *Matrix form* of operator $hat(A)$: $ A_(n m) = braket(n, hat(A), m) $ For $hat(A)^dagger$, $braket(n, hat(A)^dagger, m) = conj(braket(m, hat(A), n))$.
- *Change of basis*: $B = S^(-1) A S$.
- *Schrodinger equation in braket notation*: $ i hbar diff / (diff t) ket(psi(t)) = hat(H) ket(psi(t)) ==> ket(psi(t)) = hat(U)_t ket(psi(0)) $ where $hat(U)_t$ is unitary operator. If $hat(H)$ independent of $t$, then $hat(U)_t = exp(-i/planck.reduce t hat(H))$.
- *Exponential of operator*: $ exp(hat(A)) = sum_(n = 0)^oo hat(A)^n / n! $
- If $hat(A) = "diag"(a_1, ..., a_n)$ is diagonal, then $exp(hat(A)) = "diag"(e^(a_1), ..., e^(a_n))$.
- If $J^2 = -I$ ($I$ is identity matrix) then $ exp(J t) = cos(t) I + sin(t) J $

= Measurement and uncertainty

- For Hilbert space of finite dimension $N$, operator $hat(M)$ has $N$ eigenvalues (counting multiplicities). Eigenvalues of operator $hat(M)$ to possible values of the measurable quantity it represents.
- *Spectrum* of $hat(H)$: $ "Spec"(hat(H)) := {lambda in CC: hat(H) - lambda hat(I) "non invertible"} $ For finite-dimensional Hilbert space, this is equal to the set of eigenvalues of $hat(H)$.
- For self-adjoint operator $hat(H)$, eigenstates $ket(n)$ corresponding to different eigenvalues $lambda_n$ are orthogonal. If eigenvalue is degenerate (multiplicity greater than one) then for each eigenspace (vector space spanned by the eigenvectors) with dimension greater than one, we can choose an orthogonal basis of eigenstates (e.g. with Gram-Schmidt).
- Only eigenvalue of identity operator is $1$ with degeneracy $N$, so for any orthonormal basis of $cal(H)$: $ hat(I) = sum_n ket(n) bra(n) $
- $hat(A)$ *diagonalisable* if $hat(A) = hat(S) hat(D) hat(S)^(-1)$ where $hat(D)$ is diagonal and $hat(S)$ has columns corresponding to eigenvectors of $hat(A)$.
- For $hat(A)$ diagonalisable, $ exp(hat(A)) = sum_(n = 0)^oo (hat(S) hat(D) hat(S)^(-1))^n / (n!) = hat(S) (sum_(n = 0)^oo hat(D)^n / (n!)) hat(S)^(-1) = hat(S) exp(hat(D)) hat(S)^(-1) $
- *Spectral representation of operator*: $ hat(A) = sum_n lambda_n ket(n) bra(n) $ for orthonomal eigenvectors ${ket(n)}$ and eigenvalues $lambda_n$. When measurement is made on state $ ket(psi) = sum_n c_n ket(n) $ the result is $lambda_n$ with probability $p_n = |braket(n, psi)|^2 = |c_n|^2$. If result is $lambda_n$, measuring again immediately after the measurement will yield $lambda_n$, so the state is no longer $ket(psi)$ but $ket(n)$. This *collapse of the wavefunction* cannot be represented by a unitary operation, and is not reversible.
- Can describe measurement process as set of projection operators $hat(P)_n = ket(n) bra(n)$, then $p_n = braket(psi, hat(P)_n, psi)$ and resulting state $1/sqrt(p_n) hat(P)_n ket(psi)$ which is equal to $ket(n)$ up to an irrelevant overall phase. $hat(P)_n^dagger = hat(P)_n$ and $hat(P)_n^2 = hat(P)_n$. If the spectrum of $hat(A)$ is degenerate, we can define $ hat(P)_lambda := sum_(n: lambda_n = lambda) ket(n) bra(n) $ then we still have $p_lambda = braket(psi, hat(P)_lambda, psi)$ and resulting state is $1\/sqrt(p_lambda) hat(P)_lambda ket(psi)$.
- $hat(A)$ and $hat(B)$ are *compatible* if $\[hat(A), hat(B)\] = 0$.
- A state can only have definite values for observables $A$ and $B$ if it is a simultaneous eigenstate of both $hat(A)$ and $hat(B)$.
- There always exist simultaneous eigenstates for compatible operators.
- If $hat(A)$ and $hat(B)$ are not compatible, measuring $A$ then $B$ then $A$ again will not necessarily give the same result for the two measurements of $A$.
- We can view a function $f$ acting on real numbers as acting on $hat(A)$ by $ f(hat(A)) = sum_n f(lambda_n) ket(n) bra(n) $
- A *pure state* is definite, i.e. the state of the system is completely known, and the only uncertainties are due to the uncertain nature of quantum mechanics.This is classical uncertainty rather than quantum uncertainty.
- The *density matrix* of a pure state $ket(psi)$ is $ hat(rho) := ket(psi) bra(psi) $
- There is a bijective correspondence between density matrices and the associated pure states: $ hat(M) ket(psi) = lambda ket(psi) quad & <--> quad hat(M) hat(rho) = lambda hat(rho) \ ket(psi) -> hat(U) ket(psi) quad & <--> quad hat(rho) -> hat(U) hat(rho) hat(U)^dagger $ i.e. transforming a state $ket(psi)$ by unitary operator $hat(U)$ is equivalent to transforming the density matrix $hat(rho)$ to $hat(U) hat(rho) hat(U)^dagger$.
- For orthonormal basis states $ket(n)$, *trace* of $hat(A)$ is $ tr(hat(A)) = sum_n braket(n, hat(A), n) $
- *Cyclicity of trace*: $ tr(A B C) = tr(B C A) = tr(C A B) $
- For a *density matrix* describing a *pure state* $hat(rho) = ket(psi) bra(psi)$, $ tr(hat(rho)) & = sum_n braket(n, hat(rho), n) = sum_n braket(n, psi) braket(psi, n) \ & = sum_n braket(psi, n) braket(n, psi) = bra(psi) (sum_n ket(n) bra(n)) ket(psi) = braket(psi, hat(I), psi) = braket(psi, psi) = 1 $ Also $tr(hat(rho)^2) = 1$ since $hat(rho)$ is a projector and hence $hat(rho)^2 = hat(rho)$.
- A *mixed state* is one where the state of the system is not known. It is an ensemble of pure states each with an associated probability of the system being in that state: ${(p_i, ket(i))}$, where the $ket(i)$ are normalised (not necessarily orthogonal).
- *Density matrix* of a *mixed state* is lienar combination of density matrices for each pure state weighted by probability: $ hat(rho) := sum_i p_i ket(i) bra(i) $ Can generalise definition to include possibility of ensembles containing mixed states: $hat(rho) = sum_i p_i hat(rho)_i$ where $hat(rho)_i$ are mixed and/or pure density matrices.
- *Note*: generally the ensemble that gives rise to a given density matrix for a mixed state is not unique.
- *Example*: for ensemble ${(3/4, ket(0)), (1/4, ket(1))}$, $ hat(rho) = 3/4 ket(0) bra(0) + 1/4 ket(1) bra(1) = mat(3\/4, 0; 0, 1\/4) $ This ensemble is *not* unique: $ {(1/2, sqrt(3/4) ket(0) + sqrt(1/4) ket(1)), (1/2, sqrt(3/4) ket(0) - sqrt(1/4) ket(1))} $ gives an equivalent density matrix: $ hat(rho)_1 & = (sqrt(3/4) ket(0) + sqrt(1/4) ket(1))(sqrt(3/4) bra(0) + sqrt(1/4) bra(1)) \ & = 3/4 ket(0) bra(0) + 1/4 ket(1) bra(1) + ..., hat(rho)_2 = ..., 1/2 hat(rho)_1 + 1/2 hat(rho)_2 = mat(3\/4, 0; 0, 1\/4) $
- For observable $hat(A)$ expressed in matrix form with basis as the states $ket(psi_i)$, then $expected(hat(A)) = tr(hat(rho) hat(A))$. For mixed state, we still have $tr(hat(rho)) = 1$ but $tr(hat(rho)^2) = sum_i p_i^2 <= 1$ with equality only when some $p_i = 1$ (i.e. a pure state). $tr(hat(rho)^2)$ conveys how "mixed" the state is.
- *Example*: $ expected(E)_psi & = braket(psi, hat(H), I, psi) = sum_n braket(psi, hat(H), n) braket(n, psi) \ & = sum_n braket(n, psi) braket(psi, hat(H), n) = sum_n braket(n, hat(rho)_psi, hat(H), n) = tr(hat(rho)_psi hat(H)) $
- Mixed states can only give a pure state when there is one pure state with probability $1$.
- *Definition*: $hat(rho)$ is a *density operator* on a Hilbert space if
    - *Normalised*: $tr(hat(rho)) = 1$
    - *Hermitian*: $hat(rho)^dagger = hat(rho)$
    - *Semi-positive-definite*: for every state $ket(psi)$, $braket(psi, hat(rho), psi) >= 0$ (can be $= 0$ when $ket(psi) != 0$).
- All density matrices are density operators.
- After taking a measurement of a pure or mixed state:  
    - The measurement is $lambda$ with probability $p_lambda = tr(hat(P)_lambda hat(rho) hat(P)_lambda) = tr(hat(P)_lambda hat(rho))$.
    - Density matrix after measuring value of $lambda$ is $ hat(rho) -> 1/p_lambda hat(P)_lambda hat(rho) hat(P)_lambda = 1/tr(hat(P)_lambda hat(rho) hat(P)_lambda) hat(P)_lambda hat(rho) hat(P)_lambda $
- *Theorem*: let $hat(rho)$ be a density operator on a Hilbert space, then $hat(rho)$ corresponds to a pure state iff $tr(hat(rho)^2) = 1$.

= Qubits and the Bloch sphere

== Qubits

- *Definition*: a *qubit* is a state in a two-dimensional Hilbert space. Usually the *computational basis* ${ket(0), ket(1)}$ is used to denote the basis for such a Hilbert space.
- A general pure state in a qubit system is of the form $ ket(psi) = cos(theta / 2) ket(0) + e^(i phi) sin(theta / 2) ket(1), quad 0 <= theta <= pi, 0 <= phi < 2pi $ This state is normalised: $|cos(theta / 2)|^2 + |e^(i phi) sin(theta / 2)|^2 = 1$. This gives a bijection between pure qubit states and points on $S^2$, called the *Bloch sphere*.
- Any point on the Bloch sphere can be labelled by its position vector: $ vd(r) = vec(x, y, z), quad x = sin(theta) cos(phi), y = sin(theta) sin(phi), z = cos(theta) $
- There are six special states on the Bloch sphere: $ 
ket(+) := 1/sqrt(2) (ket(0) + ket(1)) <-> 1/sqrt(2) vec(1, 1): & quad vd(r) = vec(1, 0, 0), quad (theta, phi) = (pi\/2, 0) \
ket(-) := 1/sqrt(2) (ket(0) - ket(1)) <-> 1/sqrt(2) vec(1, -1): & quad vd(r) = vec(-1, 0, 0), quad (theta, phi) = (pi\/2, pi) \
ket(L) := 1/sqrt(2) (ket(0) + i ket(1)) <-> 1/sqrt(2) vec(1, i): & quad vd(r) = vec(0, 1, 0), quad (theta, phi) = (pi\/2, pi\/2) \
ket(R) := 1/sqrt(2) (ket(0) - i ket(1)) <-> 1/sqrt(2) vec(1, -i): & quad vd(r) = vec(0, -1, 0), quad (theta, phi) = (pi\/2, 3pi\/2) \
ket(0) <-> vec(1, 0): & quad vd(r) = vec(0, 0, 1), quad (theta, phi) = (0, dot.op) \
ket(1) <-> vec(0, 1): & quad vd(r) = vec(0, 0, -1), quad (theta, phi) = (pi, dot.op) $

== Inside the Bloch sphere

- *Definition*: *Pauli $sigma$-matrices* are $ sigma_1 := mat(0, 1; 1, 0), quad sigma_2 := mat(0, -i; i, 0), quad sigma_3 := mat(1, 0; 0, -1) $
- Density matrix for $ket(psi) = cos(theta / 2) ket(0) + e^(i phi) sin(theta / 2) ket(1)$ is given by $ hat(rho) = ket(psi) bra(psi) -> rho & = vec(cos(theta / 2), e^(i phi) sin(theta / 2)) mat(cos(theta / 2), e^(-i phi) sin(theta / 2)) \ & = 1/2 mat(1 + cos(theta), e^(-i phi) sin(theta); e^(i phi) sin(theta), 1 - cos(theta)) = 1/2 mat(1 + z, x - i y; x + i y, 1 - z) \ & = 1/2 (I_2 + vd(r) dot.op sigma) $ where $vd(r) dot.op sigma = r_1 sigma_1 + r_2 sigma_2 + r_3 sigma_3 = x sigma_1 + y sigma_2 + z sigma_3$.
- Density matrix for pure state is linear in the Bloch vector $vd(r)$, so mixed states have Bloch vector given by linear combination of Bloch vectors of states in the ensemble.
- For mixed state ${(p_i, rho_i): i in [m]}$ where $rho_i$ are pure state density matrices defined by Bloch vectors $vd(r)_i$, density matrix for mixed state is $ rho = sum_(i = 1)^m p_i rho_i = sum_(i = 1)^m p_i 1/2 (I_2 + vd(r)_i dot.op sigma) = 1/2 (I_2 + vd(r) dot.op sigma) $ where $vd(r) = sum_(i = 1)^m p_i r_i$. Now $ |vd(r)|^2 & = |sum_(i = 1)^m p_i vd(r)_i|^2 = sum_((i, j) in [m]^2) p_i p_j vd(r)_i dot.op vd(r)_j \ & <= sum_((i, j) in [m]^2) p_i p_j |vd(r)_i|^2 |vd(r)_j|^2 = sum_((i, j) in [m]^2) p_i p_j = sum_(i = 1)^m p_i sum_(j = 1)^m p_j = 1 $ by Cauchy-Schwartz inequality. Equality holds iff all $vd(r)_i$ are collinear, hence iff it is a pure state. So strictly mixed states are defined by a Bloch vector $vd(r)$ with $|vd(r)| < 1$.
- For any density matrix $rho$, $ tr(rho^2) = 1/2 (1 + |vd(r)|^2) $

== Time evolution of a qubit

- Unitary transformations of a qubit correspond to rotations of points on/in the Bloch sphere about the origin, representing the fact that unitary transformations cannot transform pure states to mixed states
- $tr(rho^2) = 1/2 (1 + |vd(r)|^2)$ is invariant under unitary transformations. It measures how mixed a state is: $tr(rho^2) = 1$ for pure states, $tr(rho^2) = 1/2$ for the most mixed state (corresponds to the origin, $vd(r) = vd(0)$, $rho = 1/2 I$).
- Measurements are not unitary transformations but projection operators, and can transform any state to a pure state.
- *Example*:
    - For $vd(r_1), vd(r_2)$ distinct points on the Bloch sphere, density matrix corresponding to mixed state ${(p, vd(r_1)), (1 - p, vd(r_2))}$ is $ rho = p rho_1 + (1 - p) rho_2 = 1/2 (I + vd(r) dot.op sigma), quad vd(r) = p vd(r_1) + (1 - p) vd(r_2) $
    - Geometrically, $vd(r)$ lies in line between $vd(r_1)$ and $vd(r_2)$ inside the Bloch sphere (since $p in [0, 1]$).
    - Mixing states can never produce a state further from the origin than the furthest initial state.
    - There are an infinite number of ways of writing a mixed state as an ensemble of two pure states: any line passing through the point represented by the mixed states intersects with the Bloch sphere twice - the intersection points give the pure states in the ensemble.
    - Most mixed state, with $rho = 1/2 I_2$, corresponds to ensemble of antipodal points, each with probability $1/2$.
- *Definition*: *trace distance* between two density matrices: $ D\(hat(rho)_1, hat(rho)_2\) = 1/2 tr |hat(rho)_1 - hat(rho)_2| = 1/4 tr |(vd(r_1) - vd(r_2)) dot.op sigma| = 1/2 |vd(r_1) - vd(r_2)| = sum_i |lambda_i| $ where $|hat(A)| = sqrt(hat(A)^dagger hat(A))$ and $lambda_i$ are the eigenvalues of $hat(rho)_1 - hat(rho)_2$ (equal to sum of eigenvalues assuming that $hat(rho)_1 - hat(rho)_2$ is Hermitian).
- Trace distance defines a *metric* on set of density matrices:
    - *Non-negative*: $D\(hat(rho)_1, hat(rho)_2\) >= 0$.
    - *Separates points*: $D\(hat(rho)_1, hat(rho)_2\) = 0 <==> hat(rho)_1 = hat(rho)_2$.
    - *Symmetric*: $D\(hat(rho)_1, hat(rho)_2\) = D\(hat(rho)_2, hat(rho)_2\)$.
    - *Triangle inequality*: $D\(hat(rho)_1, hat(rho)_3\) <= D\(hat(rho)_1, hat(rho)_2\) + D\(hat(rho)_2, hat(rho)_3\)$

== Pauli matrices

- *Definition*: *Levi-Cevita* tensor $epsilon_(i j k)$ satisfies:
    - $epsilon_(1 2 3) = epsilon_(2 3 1) = epsilon_(3 1 2)$.
    - $epsilon_(3 2 1) = epsilon_(1 3 2) = epsilon_(2 1 3)$.
    - $epsilon_(i j k) = 0$ otherwise for ${i, j, k} subset.eq {1, 2, 3}$.
- Properties of Pauli matrices:
    - *Hermitian*: $sigma_i^dagger = sigma_i$.
    - *Traceless*: $tr(sigma_i) = 0$.
    - $[sigma_i, sigma_j] = sigma_i sigma_j - sigma_j sigma_i = 2i epsilon_(i j k) sigma_k$.
    - ${sigma_i, sigma_j} = sigma_i sigma_j + sigma_j sigma_i = 2 delta_(i j) I_2$.
    - $sigma_i sigma_j = delta_(i j) I_2 + i epsilon_(i j k) sigma_k$.
    - Form a basis for vector space of $2 times 2$ Hermitian traceless matrices.
- The operators $ X & = 1/2 (I_2 - sigma_1) = 1/2 mat(1, -1; -1, 1) \ Y & = 1/2 (I_2 - sigma_2) = 1/2 mat(1, i; -i, 1) \ Z & = 1/2 (I_2 - sigma_3) = 1/2 mat(0, 0; 0, 2) $ have their eigenvectors as the six special Bloch states, with eigenvalues $0$ or $1$: $ X ket(+) & = 0 ket(+), quad X ket(-) = 1 ket(-), \ Y ket(L) & = 0 ket(L), quad Y ket(R) = 1 ket(R), \ Z ket(0) & = 0 ket(0), quad Z ket(1) = 1 ket(1) $
- The exponentials of Pauli matrices are unitary matrices: $forall alpha in RR$, $ exp(i alpha sigma_1) & = mat(cos(alpha), i sin(alpha); i sin(alpha), cos(alpha)) = cos(alpha) I_2 + i sin(alpha) sigma_1, \ exp(i alpha sigma_2) & = mat(cos(alpha), sin(alpha); -sin(alpha), cos(alpha)) = cos(alpha) I_2 + i sin(alpha) sigma_2, \ exp(i alpha sigma_3) & = mat(e^(i alpha), 0; 0, e^(-i alpha)) = cos(alpha) I_2 + i sin(alpha) sigma_3 $
- For $alpha in RR$, $vd(n) in RR^3$, $|vd(n)|^2 = 1$, $ U_alpha (vd(n)) := exp(i alpha vd(n) dot.op sigma) = cos(alpha) I_2 + i sin(alpha) vd(n) dot.op sigma $ is unitary transformation so is time evolution operator. If density mmatrix $rho = 1/2 (I_2 + vd(r) dot.op sigma)$ evolves with time according to this operator, then $ rho -> U_alpha (vd(n)) rho U_alpha (vd(n))^dagger = 1/2 (I_2 + (R_alpha (vd(n)) vd(r)) dot.op sigma) $ where $R_alpha (vd(n))$ is $3 times 3$ orthogonal matrix corresponding to rotation of angle $2 alpha$ about axis in the direction of $vd(n)$.

= Bipartite systems

== Tensor products

- *Tensor product* $ket(phi) tp ket(psi)$ in $H_1 tp H_2$ satisfies:
    - *Scalar multiplication*: $c(ket(phi) tp ket(psi)) = (c ket(phi)) tp ket(psi) = ket(phi) tp (c ket(psi))$
    - *Linearity*:
        - $a ket(psi) tp ket(phi_1) + b ket(psi) tp ket(phi_2) = ket(psi) tp (a ket(phi_1) + b ket(phi_2))$
        - $a ket(psi_1) tp ket(phi) + b ket(psi_2) tp ket(phi) = (a ket(psi_1) + b ket(psi_2)) tp ket(phi)$
- Inner products of $H_1$ and $H_2$ induce an inner product on $H_1 tp H_2$: for $ket(psi_1), ket(psi_2) in H_1$, $ket(phi_1), ket(phi_2) in H_2$, $ (bra(psi_1) tp bra(phi_1))(ket(psi_2) tp ket(phi_2)) = braket(psi_1, psi_2) braket(phi_1, phi_2) $
- For bases ${ket(i)}$ for $H_1$ and ${ket(j)}$ for $H_2$, ${ket(i) tp ket(j)}$ is basis for $H_1 tp H_2$: for $ket(psi) in H_1$, $ket(phi) in H_2$, $ ket(psi) tp ket(phi) = (sum_i a_i ket(i)) tp (sum_j b_j ket(j)) = sum_(i, j) a_i b_j ket(i) tp ket(j) $
- The most general vector $ket(psi) in H_1 tp H_2$ is $ ket(psi) = sum_(i, j) c_(i, j) ket(i) tp ket(j) $ Generally, this cannot be written as a tensor product $ket(psi) tp ket(phi)$. If it can be, it is a *separable* state. If not, it is *entangled* (e.g. a linear combination of separable states is generally entangled).
- If ${ket(i)}$, ${ket(j)}$ orthonormal then the inner product in $H_1 tp H_2$ is given by $ braket(phi, psi) & = (sum_(i, j) d_(i, j)^* bra(i) tp bra(j))(sum_(m, n) c_(m, m) ket(m) tp ket(n)) \ & = sum_(i, j, m, n) d_(i, j)^* c_(m, n) braket(i, m) braket(j, n) = sum_(i, j) d_(i, j)^* c_(i, j) $
- The Hilbert space of an $N$-qubit system is the $2^N$-dimensional Hilbert space $cal(H)_N = cal(H)_q^(tp N)$ where $cal(H)_q$ is a single qubit Hilbert space.
- *Example*: let $cal(H)_3 = cal(H)_q tp cal(H)_q tp cal(H)_q$. Operator $hat(I) tp hat(sigma_1) tp hat(I)$ acts on the second qubit and leaves the other two invariant. $hat(sigma_1) ket(0) = ket(1)$ and $hat(sigma_1) ket(1) = ket(0)$ so in this basis, $sigma_1$ acts the logical NOT gate $overline((dot.op))$, where $overline(0) = 1$, $overline(1) = 0$. So $ \(hat(I) tp hat(sigma)_1 tp hat(I)\) ket(x y z) = ket(x overline(y) z) $

== Linear operators and local unitary operations

- Linear operators on $cal(H)$ can be written as linear combinations of $hat(A) tp hat(B)$, where $ (hat(A) tp hat(B)) (ket(psi) tp ket(phi)) = (hat(A) ket(psi)) tp (hat(B) ket(phi)) $
- Properties of tensor product of linear operators:
    - $hat(A) tp hat(B) + hat(C) tp hat(B) = (hat(A) + hat(C)) tp hat(B)$.
    - $hat(A) tp hat(B) + hat(A) tp hat(D) = hat(A) tp (hat(B) + hat(D))$.
    - $(hat(A) tp hat(B))^dagger = hat(A)^dagger tp hat(B)^dagger$.
    - $\(hat(A) tp hat(B)\)\(hat(C) tp hat(D)\) = \(hat(A) hat(C) tp hat(B) hat(D)\)$.
    - $tr_(cal(H)_A tp cal(H)_B) \(hat(A) tp hat(B)\) = tr_(cal(H)_A) \(hat(A)\) tr_(cal(H)_B) \(hat(B)\)$.
    So tensor product of linear operators preserves unitarity, Hermiticity, positivity, and tensor product of two projectors is a projector.
- For bipartite system, *local operations (LO)* are of the form $hat(U)_A tp hat(I)$ (for Alice) or $hat(I) tp hat(U)_B$ (for Bob). This means Alice and Bob can only act on their own qubit (assuming they have one each) where $hat(U)_A$ and $hat(U)_B$ are unitary operators or measurement operators.
- $hat(U)_A tp hat(I)$ and $hat(I) tp hat(U)_B$ commute: $\[hat(U)_A tp hat(I), hat(I) tp hat(U)_B\] = 0$, and their product is $hat(U)_A tp hat(U)_B$.
- *Note*: any unitary transformation $hat(U)_A tp hat(U)_B$ performed using LO acting on a separable state $ket(psi) tp ket(phi)$ produces another separable state: $hat(U)_A ket(psi) tp hat(U)_B ket(phi)$. In particular, an entangled state cannot be created from a separable state.
- *Example*: $ e^(hat(A) tp hat(I)) & = sum_(k = 0)^oo (hat(A) tp hat(I)) / (k!) = sum_(k = 0)^oo (hat(A) tp hat(I)) / (k!) = e^(hat(A)) tp hat(I), \ e^(hat(I) tp hat(B)) & = sum_(k = 0)^oo (hat(I) tp hat(B))^k / (k!) = sum_(k = 0)^oo (hat(I) tp hat(B)^k) / (k!) = hat(I) tp e^(hat(B)) $ Note that generally, $e^(hat(A)) tp e^(hat(B)) != e^(hat(A) tp hat(B))$ since $ e^(hat(A) tp hat(B)) & = sum_(k = 0)^oo (hat(A)^n tp hat(B)^k) / (k!), \ e^(hat(A)) tp e^(hat(B)) & = (sum_(i = 0)^oo hat(A)^i / (i!)) tp (sum_(j = 0)^oo hat(B)^j / (j!)) = sum_(i, j = 0)^oo (hat(A)^i tp hat(B)^j) / (i! j!) $
- *Definition*: a mixed state is *separable* iff it is an ensemble of separable states, and *entangled* otherwise.
- *Definition*: *density matrix* of separable pure state $ket(Psi) = ket(psi) tp ket(phi)$ is $ hat(rho) = ket(Psi) bra(Psi) = (ket(psi) tp ket(phi)) (bra(psi) tp bra(phi)) = (ket(psi) bra(psi)) tp (ket(phi) bra(phi)) = hat(rho)_A tp hat(rho)_B $ where $hat(rho)_A = ket(psi) bra(psi)$ and $hat(rho)_B = ket(phi) bra(phi)$.
- *Definition*: *density matrix* of separable mixed state is $ hat(rho) = sum_i p_i hat(rho)_A^((i)) tp hat(rho)_B^((i)) $ where ${hat(rho)_A^((i))}$ are mixed or pure states of first system, ${hat(rho)_B^((i))}$ are mixed or pure states of second system.

== Matrix representation

- *Tensor product* of two vectors is given by e.g. $ vec(1, 2, 3) tp vec(4, 5) = vec(1 vec(4, 5), 2 vec(4, 5), 3 vec(4, 5)) = vec(4, 5, 8, 10, 12, 15) $ The expression is similar for matrices: $ mat(1, 2; 3, 4) tp mat(5, 6; 7, 8) = mat(1 mat(5, 6; 7, 8), 2 mat(5, 6; 7, 8); 3 mat(5, 6; 7, 8), 4 mat(5, 6; 7, 8)) = mat(5, 6, 10, 12; 7, 8, 14, 16; 15, 18, 20, 24; 21, 24, 28, 36) $
- If ${ket(i): i in [n]}$ is orthonormal basis for $cal(H)_A$, ${ket(j): j in [m]}$ is orthonormal basis for $cal(H)_B$, then ${ket(i) tp ket(j): i in [n], j in [m]}$ is orthonormal basis for $cal(H)_A tp cal(H)_B$.
- *Note*: general vector in tensor product of Hilbert spaces is linear combination of tensor products (of vectors), general linear operator acting on tensor product of Hilbert spaces is linear combination of tensor products (of linear operators).
- *Controlled NOT (CNOT)* operator acts on $cal(H)_2 = cal(H)_q tp cal(H)_q$ and is defined as $ U = (I_2 + sigma_3) / 2 tp I_2 + (I_2 - sigma_3) / 2 tp sigma_1 $ We have $U ket(00) = ket(00)$, $U ket(01) = ket(01)$, $U ket(10) = ket(11)$, $U ket(11) = ket(10)$.

== Local measurements

- Alice and Bob can perform measurements on their own systems using self-adjoint operators of the form $hat(F) = hat(F)_A tp hat(I)$ for Alice and $hat(G) = hat(I) tp hat(G)_B$ for Bob. If $hat(F)_A$ and $hat(G)_B$ both have non-degenerate systems, these operators have projection operators $hat(F)_(A i) = ket(i) bra(i)$ and $hat(G)_(B j) = ket(j) bra(j)$.
- In the full system, $hat(F)$ and $hat(G)$ are degenerate, with degeneracy given by dimension of other subsystem, so $dim(cal(H)_B)$ for Alice's observable and $dim(cal(H)_A)$ for Bob's. Corresponding projection operators in full system are $hat(F)_i = hat(F)_(A i) tp hat(I)$ and $hat(G)_j = hat(I) tp hat(G)_(B j)$.
- Since $\[hat(F), hat(G)\] = 0$, these measurements are compatible so Alice and bob can both measure, the final state is eigenstate of both $hat(F)$ and $hat(G)$. Probability of an outcome occuring is not affected by whether Alice or Bob measures first (or simultaneously).
- Let $ket(Psi)$ be pure separable state: $ ket(Psi) = ket(psi) tp ket(phi) = sum_(i, j) alpha_i beta_j ket(i) tp ket(j) = sum_(i, j) gamma_(i j) ket(i) tp ket(j) $ where ${ket(i)}$ and ${ket(j)}$ are orthonormal bases for $cal(H)_A$ and $cal(H)_B$ respectively. If Alice measures $hat(F)$ and obtains $f_m$ with probability $|alpha_m|^2 = sum_j |gamma_(m j)|^2$, system collapses to state $ sum_j beta_j ket(m) tp ket(j) = ket(m) tp ket(phi) $ If Bob then measures $hat(G)$ and obtains $g_n$ with probability $|beta_n|^2 = sum_i |gamma_(i n)|^2$ then final state is $ket(m) tp ket(n)$. This is the same final state as when Bob measures first, except intermediate state is $ket(psi) tp ket(n)$. The probabiity of measuring $(f_m, g_n)$ is $|gamma_(m n)|^2 = |alpha_m beta_n|^2$.
- Probability of Alice measuring $f_i$ is $|braket(i, psi)|^2 = tr(hat(rho)_A hat(F)_(A i))$ where $hat(F)_(A i) = ket(i) bra(i)$. After measuring $hat(F)_A$ and finding $f_i$, Alice's state collapses to $ ket(psi) & -> ket(i) = 1/(|braket(i, psi)|) hat(F)_(A i) ket(psi) = 1/sqrt(tr(hat(rho)_A hat(F)_(A i))) hat(F)_(A i) ket(psi) \ hat(rho)_A & -> 1/tr(hat(rho)_A hat(F)_(A i)) hat(F)_(A i) hat(rho)_A hat(F)_(A i) $
- For bipartite system with separable state $ket(Psi)$, when Alice measures $hat(F)_A$, she does not operate on Bob's system, so $hat(F)_i = hat(F)_(A i) tp hat(I)$ and density matrix is $ hat(rho) = ket(Psi) bra(Psi) = (ket(psi) bra(psi)) tp (ket(phi) bra(phi)) = hat(rho)_A tp hat(rho)_B $ If Alice measures $hat(F) = hat(F)_A tp hat(I)$, outcome is $f_i$ with probability $tr\(hat(rho) hat(F)_i\) = tr\(hat(rho)_A hat(F)_(A i)\)$ and density matrix collapses to $ hat(rho) -> 1/tr(hat(rho)_A hat(F)_(A i)) hat(F)_(A i) hat(rho)_A hat(F)_(A i) tp hat(rho)_B = 1/tr(hat(rho) hat(F)_i) = hat(F)_i hat(rho) hat(F)_i $ Note that the eigenspace corresponding to eigenvalue $f_i$ is non-degenerate in $cal(H)_A$ but any $ket(i) tp ket(phi)$ with $ket(phi) in cal(H)_B$ is an eigenvector of $hat(F) tp hat(I)$ with eigenvalue $f_i$, so eigenspace is degenerate in $cal(H)_A tp cal(H)_B$. It does not matter if Alice or Bob measures first: if $hat(F) = hat(F)_A tp hat(I)$ and $hat(G) = hat(I) tp hat(G)_B$ are measured, outcome is $(f_i, g_m)$ with probability $tr(hat(rho) hat(P)_(i j))$ where $hat(P)_(i j) = hat(F)_(A i) tp hat(G)_(B j) = ket(i) bra(i) tp ket(j) bra(j)$, and state collapses to $ hat(rho) -> 1/tr(hat(rho) hat(P)_(i j)) hat(P)_(i j) hat(rho) hat(P)_(i j) = ket(i) tp ket(j) $
- For bipartite system with entangled state $ket(Psi) = sum_(i, j) gamma_(i j) ket(i) tp ket(j)$, define coefficients $ alpha_m := (sum_j |gamma_(m j)|^2)^(1\/2), quad beta_n := (sum_i |gamma_(i n)|^2)^(1\/2) $ and define auxiliary states (excluding values of $m$ and $n$ when $beta_n = 0$ or $alpha_m = 0$) $ ket(psi_n) & := 1/beta_n sum_i gamma_(i n) ket(i) in cal(H)_A, \ ket(phi_m) & := 1/alpha_m sum_j gamma_(m j) ket(j) in cal(H)_B $ Then $ ket(Psi) = sum_i alpha_i ket(i) tp ket(phi_i) = sum_j beta_j ket(psi_j) tp ket(j) $ If Alice measures $hat(F)$ with $f_i$, state collapses to $ ket(Psi) -> hat(F)_i ket(Psi) = (hat(F)_(A i) tp hat(I)) ket(Psi) tilde ket(i) tp ket(phi_i) $ i.e. the entangled state collapses to a separable state. So Bob's state depends on the result of Alice's measurement.

== Reduced density matrix

- *Definition*: for operator $hat(C) tp hat(D)$ acting on $cal(H)_A tp cal(H)_B$, *partial trace* over $cal(H)_A$ and $cal(H)_B$, $tr_A: End(cal(H)_A tp cal(H)_B) -> End(cal(H)_B)$ and $tr_A: End(cal(H)_A tp cal(H)_B) -> End(cal(H)_A)$, are respectively $ tr_A \(hat(C) tp hat(D)\) := tr\(hat(C)\) hat(D), quad tr_B \(hat(C) tp hat(D)\) := tr\(hat(D)\) hat(C) $
- *Definition*: for a given system, the *reduced density matrix* of a subsystem is partial trace of density matrix over other subsystems. So for bipartite system, $ hat(rho)_A := tr_B \(hat(rho)\), quad hat(rho)_B := tr_A \(hat(rho)\) $
- *Note*: a reduced matrix describes one subsystem, assuming no knowledge of the other system. Therefore, generally, reduced density matrices describe mixed states, even if full system is in a pure state.
- *Example*: consider state $ket(beta_00)$: $ hat(rho) & = ket(beta_00) bra(beta_00) = 1/2 (ket(0) bra(0) tp ket(0) bra(0) + ket(0) bra(1) tp ket(0) bra(1) + ket(1) bra(0) tp ket(1) bra(0) + ket(1) bra(1) tp ket(1) bra(1)) \
hat(rho)_A & = tr_B \(hat(rho)\) \
& = 1/2 (ket(0) bra(0) tr_B (ket(0) bra(0)) + ket(0) bra(1) tr_B (ket(0) bra(1)) + ket(1) bra(0) tr_B (ket(1) bra(0)) + ket(1) bra(1) tr_B (ket(1) bra(1))) \
& = 1/2 (ket(0) bra(0) + ket(1) + bra(1)) = 1/2 hat(I)
$ Can also obtain reduced density matrix by writing matrices: $ & ket(beta_00) -> vd(v) = 1/sqrt(2) vec(1, 0, 0, 1) \ hat(rho) & = vd(v) vd(v)^dagger = 1/2 mat(1, 0, 0, 1; 0, 0, 0, 0; 0, 0, 0, 0; 1, 0, 0, 1) \ & = 1/2 mat(1, 0; 0, 0) tp mat(1, 0; 0, 0) + 1/2 mat(0, 1; 0, 0) tp mat(0, 1; 0, 0) + 1/2 mat(0, 0; 1, 0) tp mat(0, 0; 1, 0) + 1/2 mat(0, 0; 0, 1) tp mat(0, 0; 0, 1) \ rho_A & = 1/2 mat(1, 0; 0, 0) tr mat(1, 0; 0, 0) + 1/2 mat(0, 1; 0, 0) tr mat(0, 1; 0, 0) + 1/2 mat(0, 0; 1, 0) tr mat(0, 0; 1, 0) + 1/2 mat(0, 0; 0, 1) tr mat(0, 0; 0, 1) \ & = 1/2 mat(1, 0; 0, 0) + 1/2 mat(0, 0; 0, 1) = 1/2 I_2 $
- Properties of reduced density matrix $hat(rho)_A$:
    - Invariant under all local operations in system $B$.
    - Under unitary transformations $hat(U)$ in system $A$, $hat(rho)_A$ transforms as normal: $hat(rho)_A -> hat(U) hat(rho)_A hat(U)^dagger$.
    - Local measurements in system $A$ can be described by $hat(rho)_A$ and operators acting on $cal(H)_A$: $tr_B \(hat(F)_i hat(rho) hat(F)_i\) = hat(F)_(A i) hat(rho)_A hat(F)_(A i)$.
- *Theorem*: if $ket(Psi) in cal(H)_A tp cal(H)_B$ is pure state, then $hat(rho)_A$ is pure iff $ket(Psi)$ is separable.
- *Corollary*: if spectrum of $hat(F)_A$ is non-degenerate then measuring $hat(F)_A$ in system $cal(H)_A$ produces separable state on system $cal(H)_A tp cal(H)_B$, i.e. measurements destroys entanglement.
- Entanglement does not violate causality (does not allow communication faster than the speed of light). I.e., if Alice makes a local measurement on an entangled system, Bob cannot detect this, even those the reduced density matrix for his system has changed.

== Classical communication

- Alice and Bob can use classical communication (CC) to communicate results of measurements of their own subsystem. If the state was initially entangled, Bob communicating a measurement to Alice would give Alice information about her subsystem.
- If Alice and Bob can use local operations (LO) and classical communication (CC), they can use LOCC.

= Entanglement applications

== Bell states

- Checks for entangled state:
    - If $ket(psi) tp ket(psi') = a ket(0) tp ket(phi) + b ket(1) tp ket(phi)$ for some $a, b in CC$, $ket(phi)$, then $ket(psi) tp ket(psi')$ is separable, otherwise entangled.
    - If reduced density matrix of either subsystem gives a pure state ($tr(rho^2) = 1$) then state is separable. If it gives a mixed state ($tr(rho^2) < 1$), state is entangled.
    - $tr(rho_A^2) = tr(rho_B^2)$ gives measure of entanglement, with max value $1$ for no entanglement, min value $1\/2$ (for single qubit subsystem) for maximally entangled states.
- *Bell states*: for $x, y in {0, 1}$, $ ket(beta_(x y)) = 1/sqrt(2) (ket(0) tp ket(y) + (-1)^x ket(1) tp ket(overline(y))) $ where $overline(0) = 1$, $overline(1) = 0$.
- Bell states are maximally entangled (trace of reduced density matrix of both sides is $1/2$) and form an orthonormal basis.
- Bell state basis is related to standard basis by unitary transformation, but Bell states can't be created from the separable standard basis by any LOCC process, since the unitary transformations between them are not of form $hat(U)_A tp hat(U)_B$ (since this preserves separability), and measurements always produce a separable state.
- Alice and Bob can individually transform any Bell state to any other Bell state by the unitary operators $hat(U)_(x y) tp hat(I)$ and $hat(I) tp hat(U)_(x y)$ respectively: $ (hat(U)_(x y) tp hat(I)) ket(beta_(0 0)) = (hat(I) tp hat(U)_(x y)) ket(beta_(0 0)) = ket(beta_(x y)) $ where $ U_(0 0) := I_2 & = mat(1, 0; 0, 1), quad U_(0 1) := sigma_1 = mat(0, 1; 1, 0), \ U_(1 0) := sigma_3 & = mat(1, 0; 0, -1), quad U_(1 1) := i sigma_2 = mat(0, 1; -1, 0) $
- *Example*: $hat(U)_(1 1) = i hat(sigma_2)$, so $hat(U)_11 ket(0) = -ket(1)$, $hat(U)_11 ket(1) = ket(0)$, and $ (hat(U)_11 tp hat(I)) ket(beta_00) & = (hat(U)_11 tp I)(1/sqrt(2) ket(0) tp ket(0) + 1/sqrt(2) ket(1) tp ket(1)) \ & = (-1/sqrt(2) ket(1) tp ket(0) + 1/sqrt(2) ket(0) tp ket(1)) = ket(beta_11) $

== Superdense coding

- Superdense coding allows one qubit to transmit two classical bits of information.
- Qubit can be used instead of classical bit: $ket(0)$ corresponds to the bit $0$, $ket(1)$ corresponds to the bit $1$. In this case, the qubit can be measured with probability $1$ with the measurement operator $1/2 (I_2 - sigma_3)$, since $ 1/2 (I_2 - sigma_3) ket(0) = 0 ket(0), quad 1/2 (I_2 - sigma_3) ket(1) = 1 ket(1) $ so measurement with outcome $0$ means state is $ket(0)$ with probability $1$, measurement with outcome $1$ means state is $ket(1)$ with probability $1$.
- Alice can prepare the qubit to represent the classical bit to send to Bob: prepare any state $ket(psi)$ and measure on it with operator $1/2 (I_2 - sigma_3)$. Outcome is $0$ or $1$ - if outcome is equal to the bit $x$ she wants to send, $ket(psi)$ has been projected to $ket(x)$, so send this state to Bob. Otherwise, perform unitary transformation $sigma_1 ket(overline(x)) = ket(x)$ and send this state to Bob.
- *Superdense coding*:
    - Alice and Bob share state $ket(beta_00)$.
    - Alice applies operation $hat(U)_(x y) tp hat(I)$ to whole system where $(x y)_2$ is the two bit message she wants to send (this just acts on her qubit). Note that this does not transmit any information to Bob, as his reduced density matrix is $rho_B = 1/2 I$ before and after the transformation.
    - Alice sends her qubit to Bob. Then Bob has the full Bell state $ket(beta_(x y))$ (he has both qubits). Bob then applies a measurement which has the four Bell states as eigenstates, which gives him the eigenvalue with probability $1$, e.g. he measures $ hat(B) = 0 ket(beta_00) bra(beta_00) + 1 ket(beta_01) bra(beta_01) + 2 ket(beta_10) bra(beta_10) + 3 ket(beta_11) bra(beta_11) $

= Information theory

== Classical information and Shannon entropy

- *Definition*: *Shannon entropy* is $ H(X) := -sum_x p(x) log_2 (p(x)) $
- *Definition*: *joint entropy* is $ H(X, Y) := -sum_(x, y) p(x, y) log_2 (p(x, y)) $
- *Proposition*: joint entropy obeys *subadditivity*: $ H(X, Y) <= H(X) + H(Y) $ with equality iff $X$ and $Y$ are independent variables, i.e. when $p(x, y) = PP(X = x) PP(Y = y)$.
- *Definition*: *relative entropy* is defined for two random variables which take same values but with different distributions $p(x)$ and $q(x)$: $ H(p(x) || q(x)) & := sum_x (p(x) log_2 (p(x)) - p(x) log_2 (q(x))) \ & = -H(X) - sum_x p(x) log_2 (q(x)) $
- *Proposition*: relative entropy is non-negative and $ H(p(x) || q(x)) = 0 <==> forall x, p(x) = q(x) $
- *Remark*: relative entropy can diverge if for some $x$, $q(x) = 0$ and $p(x) != 0$
- *Definition*: *conditional entropy* is $ H(X|Y) := H(X, Y) - H(Y) $
- *Definition*: *mutual information* of $X$ and $Y$ is $ H(X : Y) = H(X : Y) := H(X) + H(Y) - H(X, Y) >= 0 $

== Quantum entropy

- *Definition*: *von Neumann entropy* of quantum state with density operator $hat(rho)$ is $ S\(hat(rho)\) = -tr(hat(rho) log_2 (hat(rho))) = -sum_i p_i log_2 (p_i) $ where $log_2$ is applied entry-wise to $hat(rho)$ and $hat(rho) = sum_i p_i ket(i) bra(i)$.
- *Remark*: for pure state, $S\(hat(rho)\) = -1 log_2 (1) = 0$.
- *Definition*: *relative entropy* is measure of distance between two mixed states: $ S\(hat(rho)_1 || hat(rho)_2\) := tr\(hat(rho)_1 log_2 (hat(rho)_1)\) - tr\(hat(rho)_1 log_2 (hat(rho)_2)\) $
- *IGNORE SCMIDT DECOMPOSITION AND SCHMIDT NUMBER SECTION*