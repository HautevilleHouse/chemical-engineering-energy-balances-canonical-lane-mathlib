import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringEnergyBalancesCanonicalLaneLean

structure BatchReactorEnergy where
  volume : ℝ
  density : ℝ
  specificHeat : ℝ
  initialTemperature : ℝ
  finalTemperature : ℝ
  heatInput : ℝ
  reactionEnthalpy : ℝ
  conversion : ℝ
  initialMoles : ℝ
  energyBalance : volume * density * specificHeat * (finalTemperature - initialTemperature) = heatInput + (reactionEnthalpy * conversion * initialMoles)

structure BatchReactorEnergyEvidence (B : BatchReactorEnergy) where
  volumePositive : B.volume > 0
  densityPositive : B.density > 0
  specificHeatPositive : B.specificHeat > 0
  balanceClosed : B.energyBalance

def BatchReactorEnergyClosed (B : BatchReactorEnergy) : Prop :=
  B.volume > 0 ∧ B.density > 0 ∧ B.specificHeat > 0 ∧ B.energyBalance

theorem batch_reactor_energy_closed_from_evidence (B : BatchReactorEnergy) (E : BatchReactorEnergyEvidence B) : BatchReactorEnergyClosed B := by
  exact And.intro E.volumePositive (And.intro E.densityPositive (And.intro E.specificHeatPositive E.balanceClosed))

end ChemicalEngineeringEnergyBalancesCanonicalLaneLean
end HautevilleHouse