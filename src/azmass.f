      DOUBLE PRECISION FUNCTION AZMASS(A,Z)
      INTEGER A,Z
C...
C... Mark Baker 21-Oct-2016
C...            28-Feb-2017 correct for atomic electrons
C...
C... Input A, Z and output the mass in GeV/c^2
C... Note: Subtracting atomic electron masses, but not atomic binding energy
C...
      INTEGER NTAB
      PARAMETER (NTAB=20)

      DOUBLE PRECISION AMU, MELEC
      PARAMETER (AMU=0.931494095)
      PARAMETER (MELEC=0.510998946D-03)

      INTEGER AVAL(NTAB)
      INTEGER ZVAL(NTAB)
      DOUBLE PRECISION MASS(NTAB)

      DATA AVAL/1,1,2,3,3, 4,7,9,11,12, 27,28,56,63,107,
     &          109,131,179,208,238/
      DATA ZVAL/0,1,1,1,2, 2,3,4,5,6, 13,14,26,29,47,
     &          47,54,79,82,92/
      DATA MASS/1.0086649, 1.0072765, 2.0135532, 3.0160492, 3.0160293, 
     &          4.0026033, 7.0160046, 9.0121822, 11.009305, 12.000000, 
     &          26.981539, 27.976927, 55.934938, 62.929598, 106.90510, 
     &          108.90475, 130.90508, 196.96657, 207.97665, 238.05079/

      INTEGER I
C     Start with a guess that the mass is A amu
      AZMASS = A
      DO I=1,NTAB
         IF (Z.EQ.ZVAL(I)) THEN
            IF (A.EQ.AVAL(I)) THEN
               AZMASS=MASS(I)
            ENDIF
         ENDIF
      ENDDO
      AZMASS = AZMASS*AMU
      IF (A.GT.1) AZMASS=AZMASS-DBLE(Z)*MELEC
      RETURN
      END

