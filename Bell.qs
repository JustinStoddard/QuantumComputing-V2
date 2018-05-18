namespace QuantumComputing
{
  open Microsoft.Quantum.Canon;
  open Microsoft.Quantum.Primitive;

    operation Set (desired: Result, q1: Qubit) : () {
    
      body
      {
        let current = M(q1); //This is a variable set to the superposition of a qubit on a vertical axis.

        if (desired != current) //This says that if we dont get what we want "M(q1)" we flip it with an "X-Gate" or "X(q1)"
        {
          X(q1);
        }
      }
    }

    operation BellTest (count : Int, initial: Result) : (Int,Int) {
    
      body {
        mutable numOnes = 0;
        using (qubits = Qubit[1]) {
          for (test in 1..count) {
            Set (initial, qubits[0]);

            let res = M (qubits[0]);

            if (res = One ) {
              set numOnes = numOnes + 1;
            }
          }
          Set(Zero, qubits[0]);
        }
      }
      return (count-numOnes, numOnes);
    }

}
