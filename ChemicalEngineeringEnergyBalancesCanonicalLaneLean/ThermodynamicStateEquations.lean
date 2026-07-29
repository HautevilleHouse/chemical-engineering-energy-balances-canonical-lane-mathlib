import chemicalEngineeringEnergyBalancesCanonicalLaneLean.RiemannianCurvature

/-!
# Thermodynamic State Equations Package
-/

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure ThermodynamicStatePackage where
  pressure : Type u
  volume : Type v
  temperature : Type w
  internalEnergy : Type x
  equationOfState : Prop
  energyDifferential : Prop
  heatCapacity : Prop
  idealGasLimit : Prop

structure ThermodynamicStateEvidence (S : ThermodynamicStatePackage) where
  equationOfStateClosed : S.equationOfState
  energyDifferentialClosed : S.energyDifferential
  heatCapacityClosed : S.heatCapacity
  idealGasLimitClosed : S.idealGasLimit

def ThermodynamicStateClosed (S : ThermodynamicStatePackage) : Prop :=
  S.equationOfState ∧ S.energyDifferential ∧ S.heatCapacity ∧ S.idealGasLimit

theorem thermodynamic_state_closed_from_evidence
    (S : ThermodynamicStatePackage) (E : ThermodynamicStateEvidence S) :
    ThermodynamicStateClosed S := by
  exact And.intro E.equationOfStateClosed
    (And.intro E.energyDifferentialClosed
      (And.intro E.heatCapacityClosed E.idealGasLimitClosed))

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse