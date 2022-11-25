module SetXPMult.Base

public class SXPM extends IScriptable {
	private let player: ref<PlayerPuppet>;
	private let settings: SXPMDefaultSettings;

	public func Setup() -> Void {
        // ------ Settings Start ------
        // Multiplier for character level experience.
		// Default = 1.0
		this.settings.levelXPMultiplier = 1.0;

		// Multiplier for street cred experience.
		// Default = 1.0
		this.settings.streetCredMultiplier = 1.0;

		this.settings.assaultXPMultiplier = 1.0; // Assault multiplier.
		this.settings.athleticsXPMultiplier = 1.0; // Athletics multiplier.
		this.settings.streetBrawlerXPMultiplier = 1.0; // Street Brawler multiplier.
		this.settings.coldBloodXPMultiplier = 1.0; // Cold Blood multiplier.
		this.settings.quickhackingXPMultiplier = 1.0; // Quickhacking multiplier.
		this.settings.craftingXPMultiplier = 1.0; // Crafting multiplier.
		this.settings.annihilationXPMultiplier = 1.0; // Annihilation multiplier.
		this.settings.engineeringXPMultiplier = 1.0; // Engineering multiplier.
		this.settings.handgunsXPMultiplier = 1.0; // Handguns multiplier.
		this.settings.breachProtocolXPMultiplier = 1.0; // Breach Protocol multiplier.
		this.settings.bladesXPMultiplier = 1.0; // Blades multiplier.
		this.settings.ninjutsuXPMultiplier = 1.0; // Ninjutsu multiplier.

		// ------ Settings End ------
    }

	public func GetModifiedExperienceAmount(type: gamedataProficiencyType, vanillaAmount: Int32) -> Int32 {
		let newAmount: Int32;
		let multiplier: Float;

		multiplier = this.GetMultiplier(type);
        newAmount = Cast<Int32>(Cast<Float>(vanillaAmount) * multiplier);

		if newAmount < 0 {
			return vanillaAmount;
		}

		//this.LogRequestDetails(type, vanillaAmount, newAmount, multiplier);

        return newAmount;
    }

	protected func GetMultiplier(type: gamedataProficiencyType) -> Float {
		switch type {
            case gamedataProficiencyType.Level: return this.settings.levelXPMultiplier;
            case gamedataProficiencyType.StreetCred: return this.settings.streetCredMultiplier;
			case gamedataProficiencyType.Assault: return this.settings.assaultXPMultiplier;
			case gamedataProficiencyType.Athletics: return this.settings.athleticsXPMultiplier;
			case gamedataProficiencyType.Brawling: return this.settings.streetBrawlerXPMultiplier;
			case gamedataProficiencyType.ColdBlood: return this.settings.coldBloodXPMultiplier;
			case gamedataProficiencyType.CombatHacking: return this.settings.quickhackingXPMultiplier;
			case gamedataProficiencyType.Crafting: return this.settings.craftingXPMultiplier;
			case gamedataProficiencyType.Demolition: return this.settings.annihilationXPMultiplier;
			case gamedataProficiencyType.Engineering: return this.settings.engineeringXPMultiplier;
			case gamedataProficiencyType.Gunslinger: return this.settings.handgunsXPMultiplier;
			case gamedataProficiencyType.Hacking: return this.settings.breachProtocolXPMultiplier;
			case gamedataProficiencyType.Kenjutsu: return this.settings.bladesXPMultiplier;
			case gamedataProficiencyType.Stealth: return this.settings.ninjutsuXPMultiplier;

			default: return 1.0;
		}
	}

	public func GetIsEnabled() -> Bool {
        return true;
    }

	private func LogRequestDetails(
		type: gamedataProficiencyType, oldAmount: Int32,
		newAmount: Int32, multiplier: Float) -> Void {
		let msg: String;

		msg = "[" + EnumValueToString("gamedataProficiencyType", Cast<Int64>(EnumInt(type))) + "] ";
		msg += oldAmount + " * " + multiplier + " = " + newAmount;

		this.Log(msg);
	}

	private func Log(msg: String) -> Void {
		LogChannel(n"SXPM", msg);
	}
}

struct SXPMDefaultSettings {
    public let levelXPMultiplier: Float;
	public let streetCredMultiplier: Float;
	public let assaultXPMultiplier: Float;
	public let athleticsXPMultiplier: Float;
	public let streetBrawlerXPMultiplier: Float;
	public let coldBloodXPMultiplier: Float;
	public let quickhackingXPMultiplier: Float;
	public let craftingXPMultiplier: Float;
	public let annihilationXPMultiplier: Float;
	public let engineeringXPMultiplier: Float;
	public let handgunsXPMultiplier: Float;
	public let breachProtocolXPMultiplier: Float;
	public let bladesXPMultiplier: Float;
	public let ninjutsuXPMultiplier: Float;
}
