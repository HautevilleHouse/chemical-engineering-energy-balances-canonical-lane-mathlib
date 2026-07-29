import ChemicalEngineeringEnergyBalancesCanonicalLaneLean.ReactionKineticsPackage

/-!
# Thermodynamics Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure ThermodynamicsPackage {G : RiemannianCurvaturePackage}
    (K : ReactionKineticsPackage G) where
  internalEnergy : Type u
  enthalpy : Type v
  entropy : Type w
  firstLaw : Prop
  secondLaw : Prop
  gibbsFreeEnergy : Prop

structure ThermodynamicsEvidence {G : RiemannianCurvaturePackage}
    {K : ReactionKineticsPackage G} (T : ThermodynamicsPackage K) where
  firstLawClosed : T.firstLaw
  secondLawClosed : T.secondLaw
  gibbsFreeEnergyClosed : T.gibbsFreeEnergy

def ThermodynamicsClosed {G : RiemannianCurvaturePackage}
    {K : ReactionKineticsPackage G} (T : ThermodynamicsPackage K) : Prop :=
  T.firstLaw ∧ T.secondLaw ∧ T.gibbsFreeEnergy

theorem thermodynamics_closed_from_evidence
    {G : RiemannianCurvaturePackage} {K : ReactionKineticsPackage G}
    (T : ThermodynamicsPackage K) (E : ThermodynamicsEvidence T) :
    ThermodynamicsClosed T := by
  exact And.intro E.firstLawClosed
    (And.intro E.secondLawClosed E.gibbsFreeEnergyClosed)

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse
