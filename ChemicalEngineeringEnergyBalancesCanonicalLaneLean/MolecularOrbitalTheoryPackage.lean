import ChemicalEngineeringEnergyBalancesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure MolecularOrbitalTheoryPackage where
  orbitalEnergies : Prop
  wavefunctionOverlap : Prop
  bondOrder : Prop
  hybridizationState : Prop
  frontierOrbitalGap : Prop

structure MolecularOrbitalTheoryEvidence (M : MolecularOrbitalTheoryPackage) where
  orbitalEnergiesClosed : M.orbitalEnergies
  wavefunctionOverlapClosed : M.wavefunctionOverlap
  bondOrderClosed : M.bondOrder
  hybridizationStateClosed : M.hybridizationState
  frontierOrbitalGapClosed : M.frontierOrbitalGap

def MolecularOrbitalTheoryClosed (M : MolecularOrbitalTheoryPackage) : Prop :=
  M.orbitalEnergies ∧ M.wavefunctionOverlap ∧ M.bondOrder ∧ M.hybridizationState ∧ M.frontierOrbitalGap

theorem molecular_orbital_theory_closed_from_evidence (M : MolecularOrbitalTheoryPackage) (E : MolecularOrbitalTheoryEvidence M) :
    MolecularOrbitalTheoryClosed M := by
  exact And.intro E.orbitalEnergiesClosed
    (And.intro E.wavefunctionOverlapClosed
      (And.intro E.bondOrderClosed
        (And.intro E.hybridizationStateClosed E.frontierOrbitalGapClosed)))

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse