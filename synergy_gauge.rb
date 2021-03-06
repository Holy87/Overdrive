#===============================================================================
# ** Impostazioni Sinergia
#-------------------------------------------------------------------------------
# Tavola delle impostazioni della Sinergia
#===============================================================================
module H87_SINERGIC
  #--------------------------------------------------------------------------
  # * Configurazione di base della Sinergia
  #--------------------------------------------------------------------------
  # Valore masimo della sinergia
  SIN_MAX = 1000
  # Decremento della Sinergia ad ogni turno quando attiva
  SINERGY_DECREASE = 100
  # Incremento predefinito con attacco/cura
  DEFAULT_INCREASE = 15
  # Divisore per l'azione del nemico (incremento di base / divisore)
  ENEMY_DIVIDER = 3
  # Incremento per infliggere uno stato alterato
  STATE_INFLICT = 5
  # Bonus moltiplicatore se si sfrutta una debolezza
  ELEMENT_WEAKNESS_BONUS = 1.0
  # Malus moltiplicatore se si attacca con una resistenza
  ELEMENT_RESIST_MALUS = 0.5
  # Decremento della sinergia se un nemico mette KO un eroe
  ENEMY_KILL_MALUS = 100
  # Decremento della sinergia quando viene usata un'abilità speciale
  SPECIAL_SKILL_REDUCTION = 200
  #--------------------------------------------------------------------------
  # * Configurazione grafica
  #--------------------------------------------------------------------------
  # Coordinata Y della Sinergia
  SINBAR_Y = 310
  # Immagine di sfondo
  BACKGROUND_SIN = "SinergyBackground"
  # Immagine della Cornice
  CORNER_SIN = "SinergyCorner"
  # Immagine della barra attiva
  ACTIVE_SIN = "SinergyCharged"
  # Immagine del flusso animato (quello che si muove
  POWER_SIN = "SinergyPower"
  # Immagine dell'effetto particellare
  PIXEL_SIN = "SinergyPixel"
  # Immagine della luce al margine destro
  LIGHT_SIN = "SinergyLight"
  # Velocità di movimento
  MOVE_SPEED = 2
  # Tonalità della barra attiva con sinergia
  ACTIVE_TONE = Tone.new(255,0,255,255)
  # Tonalità dello sfondo attiva la sinergia
  B_ACTV_TONE = Tone.new(0,-255,0,255)
  # Tonalità dello sfondo quando non attiva
  B_DEFT_TONE = Tone.new(-30,-30,-20,255)
  # Suono di attivazione della Sinergia
  ACTIV_SOUND = "Up4"
end

#===============================================================================
# ** SinergyStats
#-------------------------------------------------------------------------------
# Attributi per la Sinergia
#===============================================================================
module SinergyStats
  INCENTIVE = /<(?:INCENTIVO|incentivo):[ ]*([\+\-]\d+)([%％])>/i
	SIN_DURAB = /<(?:DURATA_SINERGIA|durata sinergia):[ ]*([\+\-]\d+)([%％])>/i
	SIN_BONUS = /<(?:BONUS_SINERGIA|bonus sinergia):[ ]*([\+\-]\d+)([%％])>/i
  SIN_DEFEN = /<(?:DIFESA_SINERGIA|difesa sinergia):[ ]*([\+\-]\d+)([%％])>/i
  SIN_ON_GRD= /<(?:SINERGIA_DIFENDI|sinergia difendi):[ ]*(\d+)([%％])>/i
  SIN_ON_ATK= /<(?:SINERGIA_ATTACCA|sinergia attacca):[ ]*(\d+)([%％])>/i
  SIN_ON_STA= /<(?:SINERGIA_STATUS|sinergia status):[ ]*(\d+)([%％])>/i
  SIN_ON_WEA= /<(?:SINERGIA_DEBOLE|sinergia debole):[ ]*(\d+)([%％])>/i
  SIN_ON_HEA= /<(?:SINERGIA_CURA|sinergia cura):[ ]*(\d+)([%％])([%％])>/i
  SIN_ON_KIL= /<(?:SINERGIA_UCCISIONE|sinergia uccisione):[ ]*(\d+)>/i
  SIN_ON_VIC= /<(?:SINERGIA_VITTORIA|sinergia vittoria):[ ]*(\d+)>/i
  SIN_ON_EVA= /<(?:SINERGIA_EVASIONE|sinergia evasione):[ ]*(\d+)>/i
  
  attr_reader :incentive        #incentivo: incremento minimo sinergia a turni
  attr_reader :sin_durab        #bonus di durata della Sinergia quando è attiva
  attr_reader :sin_defense      #riduce il calo della sinergia quando colpito
	attr_reader :sin_bonus        #aumenta l'incremento della sinergia
  attr_reader :sin_on_guard     #aumenta la sinergia se colpito mentre ci si dif
  attr_reader :sin_on_attack    #aumenta la sinergia quando si causa danno
  attr_reader :sin_on_heal      #aumenta la sinergia quando si cura
  attr_reader :sin_on_kill      #aumenta la sinergia quando si uccide un nemico
  attr_reader :sin_on_victory   #aumenta la sinergia quando si vince
  attr_reader :sin_on_weak      #aumenta la sinergia se debolezza elementale
  attr_reader :sin_on_state     #aumenta la sinergia se si causa stati alter.
  attr_reader :sin_on_eva       #aumenta la sinergia se si schiva il colpo
  #--------------------------------------------------------------------------
  # * Caricamento degli attributi sinergia
  #--------------------------------------------------------------------------
  def load_sinergy_stats
    return if @sinergy_loaded
    @sinergy_loaded = true
		@incentive = 0
		@sin_durab = 0
		@sin_bonus = 0
    @sin_defense = 0
    @sin_on_guard = 0
    @sin_on_attack = 0
    @sin_on_heal = 0
    @sin_on_kill = 0
    @sin_on_victory = 0
    @sin_on_weak = 0
    @sin_on_state = 0
    @sin_on_eva = 0
		self.note.split(/[\r\n]+/).each { |riga|
			case riga
			when INCENTIVE
				@incentive = $1.to_i
			when SIN_DURAB
				@sin_durab = $1.to_f/100
			when SIN_BONUS
				@sin_bonus = $1.to_f/100
      when SIN_DEFEN
        @sin_defense = $1.to_f/100
      when SIN_ON_GRD
        @sin_on_guard = $1.to_f/100
      when SIN_ON_ATK
        @sin_on_attack = $1.to_f/100
      when SIN_ON_STA
        @sin_on_state = $1.to_f/100
      when SIN_ON_WEA
        @sin_on_weak = $1.to_f/100
      when SIN_ON_HEA
        @sin_on_heal = $1.to_f/100
      when SIN_ON_KIL
        @sin_on_kill = $1.to_i
      when SIN_ON_VIC
        @sin_on_victory = $1.to_i
      when SIN_ON_EVA
        @sin_on_eva = $1.to_i
			end
		}
  end
end #sinergyStats

#===============================================================================
# ** RPG::UsableItem
#-------------------------------------------------------------------------------
# Per oggetti e abilità
#===============================================================================
class RPG::UsableItem
  attr_reader :custom_sinergy       #valore personalizzato di sinergia
  attr_reader :special_skill        #è un'abilità che richiede sinergia?
  #--------------------------------------------------------------------------
  # * Caricamento attributi
  #--------------------------------------------------------------------------
  def load_sinergy_stats
    return if @sinergy_loaded
    @special_skill = false
    self.note.split(/[\r\n]+/).each { |riga|
			case riga
      when /<sinergia:[ ]*(\d+)>/i
        @custom_sinergy = $1.to_i
      when /<sinergico>/i
        @special_skill = true
      end
    }
  end
end #usableitem

#===============================================================================
# ** Classi Weapon, Armor e State
#-------------------------------------------------------------------------------
# Inclusione dei parametri sinergia
#===============================================================================
class RPG::Weapon; include SinergyStats; end
class RPG::Armor; include SinergyStats; end
class RPG::State; include SinergyStats; end

#===============================================================================
# ** Scene_Title
#-------------------------------------------------------------------------------
# Aggiunta del caricamento degli attributi
#===============================================================================
class Scene_Title < Scene_Base
  alias h87sinergy_load_database load_database unless $@
  alias h87sinergy_load_bt_database load_bt_database unless $@
  #--------------------------------------------------------------------------
  # * Caricamento del database
  #--------------------------------------------------------------------------
  def load_database
    h87sinergy_load_database
    load_data_sinergy
  end
  #--------------------------------------------------------------------------
  # * Caricamento del database per battle test
  #--------------------------------------------------------------------------
  def load_bt_database
    h87sinergy_load_bt_database
    load_data_sinergy
  end
  #--------------------------------------------------------------------------
  # * Caricamento dei dati
  #--------------------------------------------------------------------------
  def load_data_sinergy
    load_weapon_sinergy
    load_armor_sinergy
    load_state_sinergy
    load_skill_sinergy
    load_item_sinergy
  end
  #--------------------------------------------------------------------------
  # * Attributi delle abilità
  #--------------------------------------------------------------------------
  def load_skill_sinergy
    for skill in $data_skills
      next if skill.nil?
      skill.load_sinergy_stats
    end
  end
  #--------------------------------------------------------------------------
  # * Attributi delgli oggetti
  #--------------------------------------------------------------------------
  def load_item_sinergy
    for item in $data_items
      next if item.nil?
      item.load_sinergy_stats
    end
  end
  #--------------------------------------------------------------------------
  # * Caricamento degli attributi delle armi
  #--------------------------------------------------------------------------
  def load_weapon_sinergy
    for weapon in $data_weapons
      next if weapon.nil?
      weapon.load_sinergy_stats
    end
  end
  #--------------------------------------------------------------------------
  # * Attributi armature
  #--------------------------------------------------------------------------
  def load_armor_sinergy
    for armor in $data_armors
      next if armor.nil?
      armor.load_sinergy_stats
    end
  end
  #--------------------------------------------------------------------------
  # * Attributi Stati
  #--------------------------------------------------------------------------
  def load_state_sinergy
    for state in $data_states
      next if state.nil?
      state.load_sinergy_stats
    end
  end
end #title

#===============================================================================
# ** Game_Battler
#-------------------------------------------------------------------------------
# Aggiunti i controlli Sinergia
#===============================================================================
class Game_Battler
  include H87_SINERGIC
  alias h87sinergia_madv make_attack_damage_value unless $@
  alias h87sinergia_modv make_obj_damage_value unless $@
  alias h87sinergia_asc apply_state_changes unless $@
  alias h87sinergia_eff attack_effect unless $@
  alias h87sinergia_ski skill_effect unless $@
  alias h87sinergia_scu skill_can_use? unless $@
  #--------------------------------------------------------------------------
  # * Calcolo del danno di un Attacco Normale
  #     attacker : Attaccante
  #    I risultati sono assegnati a @hp_damage
  #--------------------------------------------------------------------------
  def make_attack_damage_value(attacker)
    h87sinergia_madv(attacker)
    check_sinergic_damage(attacker, attacker.element_set)
  end
  #--------------------------------------------------------------------------
  # * Controllo che se è un'abilità Sinergia, non può essere usata
  #--------------------------------------------------------------------------
  def skill_can_use?(skill)
    return false if skill.special_skill && !$game_party.sinergy_active?
    return h87sinergia_scu(skill)
  end
  #--------------------------------------------------------------------------
  # * Controlla l'aggiunta della sinergia al danno
  #--------------------------------------------------------------------------
  def check_sinergic_damage(attacker, element_set, skill = nil)
    return unless $scene.is_a?(Scene_Battle)
    return if $game_party.sinergy_active?
    $game_party.sinergic_state += sin_guard_bonus if guarding?
    return if @hp_damage == 0 && @mp_damage == 0
    mult = get_multiplier(element_set, attacker)
    $game_party.sinergic_state += attacker.sinergic_increase * mult
  end
  #--------------------------------------------------------------------------
  # * Restituisce true se viene danneggiato
  #--------------------------------------------------------------------------
  def damaged?
    return @hp_damage < 0 || @mp_damage < 0
  end
  #--------------------------------------------------------------------------
  # * Ottiene il moltiplicatore Sinergia
  #--------------------------------------------------------------------------
  def get_multiplier(element_set, attacker)
    return 0 if guarding?
    mult = @critical ? 2 : 1
    if elements_max_rate(element_set) > 100
      mult += ELEMENT_WEAKNESS_BONUS + attacker.sin_weak_bonus
    elsif elements_max_rate(element_set) < 100
      mult -= ELEMENT_RESIST_MALUS
    end
    mult -= sinergic_defense if damaged?
    mult /= 2.0 if attacker.has2w
    return mult
  end
  #--------------------------------------------------------------------------
  # * Controlla i cambi di stato
  #   obj: skill o oggetto
  #--------------------------------------------------------------------------
  def apply_state_changes(obj)
    old = @added_states.clone
    h87sinergia_asc(obj)
    return unless $scene.is_a?(Scene_Battle)
    return if $game_party.sinergy_active?
    return if old == @added_states
    user = $scene.active_battler
    $game_party.sinergic_state += user.sinergic_state
  end
  #--------------------------------------------------------------------------
  # * Applica gli effetti dell'attacco normale
  #     attacker : Attaccante
  #--------------------------------------------------------------------------
  def attack_effect(attacker)
    h87sinergia_eff(attacker)
    return if $game_party.sinergy_active?
    $game_party.sinergic_state += sin_evade_bonus if @evaded
    $game_party.sinergic_state += attacker.sin_kill_bonus if dead?
  end
  #--------------------------------------------------------------------------
  # * Applica gli effetti della skill
  #     user : Utilizzatore
  #     skill: abilità
  #--------------------------------------------------------------------------
  def skill_effect(user, skill)
    h87sinergia_ski(user, skill)
    return if $game_party.sinergy_active?
    $game_party.sinergic_state += sin_evade_bonus if @evaded
    $game_party.sinergic_state += user.sin_kill_bonus if dead?
  end
  #--------------------------------------------------------------------------
  # * Causa danno
  #--------------------------------------------------------------------------
  def make_obj_damage_value(user, obj)
    @user_actor = user.actor?
    h87sinergia_modv(user, obj)
    check_sinergic_skill(user, obj)
  end
  #--------------------------------------------------------------------------
  # * Controllo della Sinergia per un'abilità
  #--------------------------------------------------------------------------
  def check_sinergic_skill(user, obj)
    return unless $scene.is_a?(Scene_Battle)
    return if $game_party.sinergy_active?
    if @hp_damage < 0 || @mp_damage < 0
      sinergic_heal(obj)
    elsif @hp_damage > 0 || @mp_damage > 0
      check_sinergic_damage(user, obj.element_set, obj)
    end
  end
  #--------------------------------------------------------------------------
  # * Modifica sinergia per cura
  #   obj: Oggetto
  #--------------------------------------------------------------------------
  def sinergic_heal(obj)
    m = actor? ? 1 : -1
    value = obj.custom_sinergy.nil? ? sinergic_increase : obj.custom_sinergy*m
    $game_party.sinergic_state += value * sin_heal_bonus
  end
  #--------------------------------------------------------------------------
  # * Incremento sinergia del battler
  #--------------------------------------------------------------------------
  def sinergic_increase; 0; end
  #--------------------------------------------------------------------------
  # * Restituisce il rate di difesa della sinergia
  #--------------------------------------------------------------------------
  def sinergic_defense; 0.0; end
  #--------------------------------------------------------------------------
  # * Incremento sinergia del battler su status
  #--------------------------------------------------------------------------
  def sin_state_increase; 0; end
  #--------------------------------------------------------------------------
  # * Incremento della Sinergia a Status
  #--------------------------------------------------------------------------
  def sinergic_state
    return sin_state_increase * sin_state_bonus
  end
  #--------------------------------------------------------------------------
  # * Bonus Sinergia in attacco
  #--------------------------------------------------------------------------
  def sin_attack_bonus; 1.0; end
  #--------------------------------------------------------------------------
  # * Bonus Sinergia in Status
  #--------------------------------------------------------------------------
  def sin_state_bonus; 1.0; end
  #--------------------------------------------------------------------------
  # * Bonus Sinergia per debolezze
  #--------------------------------------------------------------------------
  def sin_weak_bonus; 1.0; end
  #--------------------------------------------------------------------------
  # * Bonus Sinergia per guardia
  #--------------------------------------------------------------------------
  def sin_guard_bonus; 1.0; end
  #--------------------------------------------------------------------------
  # * Bonus Sinergia per cura
  #--------------------------------------------------------------------------
  def sin_heal_bonus; 1.0; end
  #--------------------------------------------------------------------------
  # * Bonus Sinergia per evasione
  #--------------------------------------------------------------------------
  def sin_evade_bonus; 0; end
  #--------------------------------------------------------------------------
  # * Bonus Sinergia per uccisione
  #--------------------------------------------------------------------------
  def sin_kill_bonus; 0; end
  #--------------------------------------------------------------------------
  # * Bonus Sinergia per vittoria
  #--------------------------------------------------------------------------
  def sin_victory_bonus; 0; end
  #--------------------------------------------------------------------------
  # * Ha 2 armi?
  #--------------------------------------------------------------------------
  def has2w; false; end
end #game_battler
  
#===============================================================================
# ** Game_Actor
#-------------------------------------------------------------------------------
# Parametri della Sinergia
#===============================================================================
class Game_Actor < Game_Battler
  #--------------------------------------------------------------------------
  # * Restituisce l'incremento predefinito della Sinergia
  #--------------------------------------------------------------------------
  def sinergic_default_increase
    return DEFAULT_INCREASE
  end
  #--------------------------------------------------------------------------
  # * Restituisce l'incremento della Sinergia con eventuale bonus
  #--------------------------------------------------------------------------
  def sinergic_increase
    return sinergic_default_increase * sin_bonus
  end
  #--------------------------------------------------------------------------
  # * Incremento sinergia del battler su status
  #--------------------------------------------------------------------------
  def sin_state_increase
    return STATE_INFLICT
  end
  #--------------------------------------------------------------------------
  # * Restituisce equip e stati
  #--------------------------------------------------------------------------
  def features
    features = equips + states
    return features.compact
  end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus durata sinergia dell'eroe
  #--------------------------------------------------------------------------
  def sin_duration_bonus
    bonus = 1.0
    features.each{|feature| bonus += feature.sin_durab}
    bonus
  end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus sinergia dell'eroe
  #--------------------------------------------------------------------------
  def sin_bonus
    bonus = 1.0
    features.each{|feature| bonus += feature.sin_bonus}
    bonus
  end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus di riduzione sinergia se attaccati
  #--------------------------------------------------------------------------
  def sinergic_defense
    bonus = super
    features.each{|feature| bonus += feature.sin_defense}
    bonus
  end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus Sinergia quando si causa stati alterati
  #--------------------------------------------------------------------------
  def sinergic_state_bonus
    return sinergic_default_increase * sin_state_bonus
  end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus Sinergia quando si sfruttano le debolezze
  #--------------------------------------------------------------------------
  def sinergic_weak_bonus
    return sinergic_default_increase * sin_weak_bonus
  end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus attacco
  #--------------------------------------------------------------------------
  def sin_attack_bonus
    bonus = super
    features.each{|feature| bonus += feature.sin_on_attack}
    bonus
  end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus guardia
  #--------------------------------------------------------------------------
  def sin_guard_bonus
    bonus = super
    features.each{|feature| bonus += feature.sin_on_guard}
    bonus
  end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus uccisione
  #--------------------------------------------------------------------------
  def sin_kill_bonus
    bonus = super
    features.each{|feature| bonus += feature.sin_on_kill}
    bonus
  end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus debolezze
  #--------------------------------------------------------------------------
  def sin_weak_bonus
    bonus = super
    features.each{|feature| bonus += feature.sin_on_weak}
    bonus
  end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus stato alterato
  #--------------------------------------------------------------------------
  def sin_state_bonus
    bonus = super
    features.each{|feature| bonus += feature.sin_on_state}
    bonus
  end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus Vittoria
  #--------------------------------------------------------------------------
  def sin_victory_bonus
    bonus = super
    features.each{|feature| bonus += feature.sin_on_victory}
    bonus
  end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus Cura
  #--------------------------------------------------------------------------
  def sin_heal_bonus
    bonus = 0
    features.each{|feature| bonus += feature.sin_on_heal}
    bonus
  end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus Evasione
  #--------------------------------------------------------------------------
  def sin_evade_bonus
    bonus = 0
    features.each{|feature| bonus += feature.sin_on_eva}
    bonus
  end    
  #--------------------------------------------------------------------------
  # * Restituisce il bonus Incentivo dell'eroe
  #--------------------------------------------------------------------------
  def sin_incentive
    bonus = 0
    features.each{|feature| bonus += feature.incentive}
    bonus
  end
end #game_actor

#===============================================================================
# ** Game_Enemy
#-------------------------------------------------------------------------------
# Constrollo Sinergia alla morte
#===============================================================================
class Game_Enemy < Game_Battler
  #--------------------------------------------------------------------------
  # * Restituisce l'incremento predefinito della Sinergia
  #--------------------------------------------------------------------------
  def sinergic_default_increase
    return DEFAULT_INCREASE / ENEMY_DIVIDER * -1
  end
  #--------------------------------------------------------------------------
  # * Restituisce l'incremento della Sinergia
  #--------------------------------------------------------------------------
  def sinergic_increase
    return sinergic_default_increase
  end
  #--------------------------------------------------------------------------
  # * Incremento sinergia del battler su status
  #--------------------------------------------------------------------------
  def sin_state_increase
    return STATE_INFLICT / ENEMY_DIVIDER * -1
  end
  #--------------------------------------------------------------------------
  # * Decremento della Sinergia se un nemico uccide un alleato
  #--------------------------------------------------------------------------
  def sin_kill_bonus 
    return ENEMY_KILL_MALUS * -1
  end
end #enemy

#===============================================================================
# ** Game_Party
#-------------------------------------------------------------------------------
# Aggiunta della Sinergia del gruppo
#===============================================================================
class Game_Party < Game_Unit
  include H87_SINERGIC
  #--------------------------------------------------------------------------
  # * Restituisce il bonus della sinergia iniziale
  #--------------------------------------------------------------------------
  def incentivo_sinergia
    bonus = 0
    for member in members
      bonus += member.sin_incentive
    end
    return [bonus, SIN_MAX].min
  end
  #--------------------------------------------------------------------------
  # * Imposta la sinergia del gruppo
  #   value: valore sinergia
  #--------------------------------------------------------------------------
  def sinergic_state=(value)
    @sinergic_state = 0 if @sinergic_state.nil?
    return if @sinergic_state >= SIN_MAX
    @sinergic_state = value
    @sinergic_state = 0 if @sinergic_state < 0
    @sinergic_state = SIN_MAX if @sinergic_state > SIN_MAX
    check_sinergy_activation
  end
  #--------------------------------------------------------------------------
  # * Aggiunge sinergia
  #--------------------------------------------------------------------------
  def add_sinergy(value)
    s1 = sinergic_state
    sinergic_state = s1 + value
  end
  #--------------------------------------------------------------------------
  # * Riempie la sinergia al massimo
  #--------------------------------------------------------------------------
  def fill_sinergy
    sinergic_state = SIN_MAX
  end
  #--------------------------------------------------------------------------
  # * Riduce forzatamente la sinergia anche quando è piena
  #   value: valore di riduzione
  #--------------------------------------------------------------------------
  def force_scale(value)
    @sinergic_state -= value
    @sinergic_state = 0 if @sinergic_state < 0
    check_sinergy_activation
  end
  #--------------------------------------------------------------------------
  # * Restituisce la sinergia del gruppo
  #--------------------------------------------------------------------------
  def sinergic_state
    @sinergic_state = 0 if @sinergic_state.nil?
    return @sinergic_state
  end
  #--------------------------------------------------------------------------
  # * Controllo attivazione Sinergia
  #--------------------------------------------------------------------------
  def check_sinergy_activation
    if sinergy_active?
      @sinergy_active = false if @sinergic_state <= 0
    else
      @sinergy_active = true if @sinergic_state >= SIN_MAX
    end
  end
  #--------------------------------------------------------------------------
  # * Restituisce se la Sinergia è attivata
  #--------------------------------------------------------------------------
  def sinergy_active?
    return @sinergy_active
  end
  #--------------------------------------------------------------------------
  # * Imposta il valore della Sinergia
  #--------------------------------------------------------------------------
  def sinergy_active=(value)
    @sinergy_active = value
  end
  #--------------------------------------------------------------------------
  # * Incremento della sinergia per bonus vittoria
  #--------------------------------------------------------------------------
  def check_sinergic_victory
    return if sinergy_active?
    add_sinergy(sinergic_victory)
  end
  #--------------------------------------------------------------------------
  # * Bonus vittoria sinergia
  #--------------------------------------------------------------------------
  def sinergic_victory
    bonus = 0
    for member in battle_members
      next if member.nil?
      bonus += member.sin_victory_bonus
    end
    return bonus
  end
  #--------------------------------------------------------------------------
  # * Aggiornamento della Sinergia alla fine del turno
  #--------------------------------------------------------------------------
  def update_sinergy_turn
    val = sinergy_incentive
    if sinergy_active? && sinergic_state < SIN_MAX
      val -= (SINERGY_DECREASE / sinergy_bonus_duration)
    end
    sinergic_state = val
  end
  #--------------------------------------------------------------------------
  # * Restituisce l'incentivo totale della Sinergia
  #--------------------------------------------------------------------------
  def sinergy_incentive
    return 0 if sinergy_active?
    sum = 0
    for member in battle_members
      next if member.nil?
      sum += member.sin_incentive
    end
    sum
  end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus durata della Sinergia
  #--------------------------------------------------------------------------
  def sinergy_bonus_duration
    sum = 1.0
    for member in battle_members
      next if member.nil?
      sum += member.sin_duration_bonus
    end
    sum
  end
end #game_enemy

#===============================================================================
# ** Scene_Battle
#-------------------------------------------------------------------------------
# Aggiunta barra Sinergia
#===============================================================================
class Scene_Battle < Scene_Base
  alias h87sin_start start unless $@
  alias h87sin_update_basic update_basic unless $@
  alias h87sin_terminate terminate unless $@
  alias h87sin_tend turn_end unless $@
  alias h87sin_eas execute_action_skill unless $@
  alias h87sin_process_victory process_victory unless $@
  #--------------------------------------------------------------------------
  # * Inizio
  #--------------------------------------------------------------------------
  def start
    h87sin_start
    create_sin_bar
  end
  #--------------------------------------------------------------------------
  # * Aggiornamento
  #--------------------------------------------------------------------------
  def update_basic(main = false)
    h87sin_update_basic(main)
    update_sin_bar
  end
  #--------------------------------------------------------------------------
  # * Terminazione
  #--------------------------------------------------------------------------
  def terminate
    h87sin_terminate
    dispose_sin_bar
    reset_sinergy
  end
  #--------------------------------------------------------------------------
  # * Fine del turno
  #--------------------------------------------------------------------------
  def turn_end(member = nil)
    h87sin_tend(member)
    check_sinergy_change
  end
  #--------------------------------------------------------------------------
  # * Riduzione della Sinergia
  #--------------------------------------------------------------------------
  def execute_action_skill
    h87sin_eas
    skill = @active_battler.action.skill
    return if skill.nil?
    if skill.special_skill
      $game_party.force_scale(H87_SINERGIC::SPECIAL_SKILL_REDUCTION)
    end
  end
  #--------------------------------------------------------------------------
  # * Esecuzione di vittoria
  #--------------------------------------------------------------------------
  def process_victory
    h87sin_process_victory
    $game_party.check_sinergic_victory
  end
  #--------------------------------------------------------------------------
  # * Reset della Sinergia a fine battaglia se era attivata.
  #   Dato che il valore non cambia se la sinergia è al max, la sinergia si
  #   resetta solo se il giocatore ha usato almeno una skill speciale.
  #--------------------------------------------------------------------------
  def reset_sinergy
    $game_party.sinergy_state = 0 if $game_party.sinergy_active?
  end
  #--------------------------------------------------------------------------
  # * Cambia la sinergia alla fine del turno
  #--------------------------------------------------------------------------
  def check_sinergy_change
    $game_party.update_sinergy_turn
  end
  #--------------------------------------------------------------------------
  # * Creazione della barra Sinergia
  #--------------------------------------------------------------------------
  def create_sin_bar
    create_sinergy_viewports
    create_sinergy_graphic
  end
  #--------------------------------------------------------------------------
  # * Creazione dei viewport
  #--------------------------------------------------------------------------
  def create_sinergy_viewports
    @s_view1 = Viewport.new(0,0,Graphics.width, Graphics.height)
    @s_view1.z = 150
    @s_view2 = Viewport.new(0,0,0,0)
    @s_view2.z = 200
    @s_view3 = Viewport.new(0,0,Graphics.width, Graphics.height)
    @s_view3.z = 250
  end
  #--------------------------------------------------------------------------
  # * Aggiornamento della barra Sinergia
  #--------------------------------------------------------------------------
  def create_sinergy_graphic
    @sinergy_bar = Sprite_Sinergy.new(@s_view1, @s_view2, @s_view3)
  end
  #--------------------------------------------------------------------------
  # * Aggiornamento della barra Sinergia
  #--------------------------------------------------------------------------
  def update_sin_bar
    @sinergy_bar.update
  end
  #--------------------------------------------------------------------------
  # * Eliminazione della barra Sinergia
  #--------------------------------------------------------------------------
  def dispose_sin_bar
    @sinergy_bar.dispose
    @s_view1.dispose
    @s_view2.dispose
    @s_view3.dispose
  end  
end #scene_battle

#===============================================================================
# ** Sprite_Sinergy
#-------------------------------------------------------------------------------
# Sprite principale della Sinergia
#===============================================================================
class Sprite_Sinergy
  include H87_SINERGIC
  #--------------------------------------------------------------------------
  # * Inizializzazione
  #   view1, 2 e 3: viewport di sfondo, della barra e della cornice
  #--------------------------------------------------------------------------
  def initialize(view1, view2, view3)
    @view1 = view1
    @view2 = view2
    @view3 = view3
    @pixels = []
    create_graphic
    set_proper_value
  end
  #--------------------------------------------------------------------------
  # * Creazione della grafica
  #--------------------------------------------------------------------------
  def create_graphic
    @fake_sprite = Sprite.new
    create_background_rect
    create_fill_rect
    create_corner
  end
  #--------------------------------------------------------------------------
  # * Aggiunge un nuovo pixel
  #--------------------------------------------------------------------------
  def add_pixel
    height = @fill.height
    pixel = Sprite.new(@view2)
    pixel.bitmap = Cache.system(PIXEL_SIN)
    pixel.ox = pixel.width/2
    pixel.oy = pixel.height/2
    pixel.x = @fill.x + @view2.rect.width
    pixel.y = rand(height) + @fill.y
    pixel.opacity = 200
    @pixels.push(pixel)
  end
  #--------------------------------------------------------------------------
  # * Aggiunge un nuovo pixel (con sinergia attiva)
  #--------------------------------------------------------------------------
  def add_superpixel
    pixel = Sprite.new(@view2)
    pixel.bitmap = Cache.system(PIXEL_SIN)
    pixel.ox = pixel.width/2
    pixel.oy = pixel.height/2
    pixel.y = @fill.height + @fill.y
    pixel.x = rand(@view2.rect.width) + @fill.x
    pixel.tone = ACTIVE_TONE
    pixel.opacity = 200
    @pixels.push(pixel)
  end
  #--------------------------------------------------------------------------
  # * Aggiorna i pixel
  #--------------------------------------------------------------------------
  def update_pixels
    @pixels.each do |pixel|
      pixel.x -= 1
      pixel.opacity -= 10
      if pixel.opacity == 0
        pixel.dispose
        @pixels.delete(pixel)
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Aggiorna i pixel in sinergia attiva
  #--------------------------------------------------------------------------
  def update_superpixels
    @pixels.each do |pixel|
      pixel.y -= 1
      pixel.opacity -= 20
      if pixel.opacity == 0
        pixel.dispose
        @pixels.delete(pixel)
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Crea l'immagine di sfondo della barra
  #--------------------------------------------------------------------------
  def create_background_rect
    @background = Sprite.new(@view1)
    @background.bitmap = Cache.system(BACKGROUND_SIN)
    @background.x = Graphics.width/2 - @background.width / 2
    @background.y = SINBAR_Y
    @background.opacity = 200
    @background.tone = B_DEFT_TONE
  end
  #--------------------------------------------------------------------------
  # * Crea l'immagine della barra
  #--------------------------------------------------------------------------
  def create_fill_rect
    @fill = Sprite.new(@view2)
    @fill.bitmap = Cache.system(ACTIVE_SIN)
    @power = Plane.new(@view2)
    @power.bitmap = Cache.system(POWER_SIN)
    @power.opacity = 50
    @power2 = Plane.new(@view2)
    @power2.bitmap = Cache.system(POWER_SIN)
    @power2.zoom_x = 2
    @power2.zoom_y = 2
    @power2.opacity = 50
    @view2.rect.x = @background.x
    @view2.rect.y = @background.y
    @view2.rect.height = @background.height
    @light = Sprite.new(@view2)
    @light.bitmap = Cache.system(LIGHT_SIN)
    @light.y = @fill.y
    @light.ox = @light.width/2
  end
  #--------------------------------------------------------------------------
  # * Crea la cornice della barra
  #--------------------------------------------------------------------------
  def create_corner
    @corner = Sprite.new(@view3)
    @corner.bitmap = Cache.system(CORNER_SIN)
    @corner.x = Graphics.width/2 - @corner.width / 2
    @corner.y = SINBAR_Y + (@background.height/2 - @corner.height/2)
  end
  #--------------------------------------------------------------------------
  # * Imposta il valore della Sinergia
  #--------------------------------------------------------------------------
  def set_proper_value
    @fake_sprite.x = fill_width($game_party.sinergic_state)
    @view2.rect.width = @fake_sprite.x
  end
  #--------------------------------------------------------------------------
  # * Restituisce la larghezza che deve avere il viewport della barra
  #--------------------------------------------------------------------------
  def fill_width(value)
    return [[@background.width.to_f / SIN_MAX * value, 0].max, @background.width].min
  end
  #--------------------------------------------------------------------------
  # * Aggiornamento
  #--------------------------------------------------------------------------
  def update
    update_size
    update_animation
    update_activation
    handle_pixels
    @background.update
    @corner.update
    @fill.update
  end
  #--------------------------------------------------------------------------
  # * Gestione degli effetti particellari
  #--------------------------------------------------------------------------
  def handle_pixels
    unless @active
      update_pixels
      add_pixel
    else
      update_superpixels
      flash_bar
      for i in 0..@view2.rect.width/20+1
        add_superpixel
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Eliminazione
  #--------------------------------------------------------------------------
  def dispose
    @background.dispose
    @corner.dispose
    @fill.dispose
    @power.dispose
    @pixels.each {|pixel| pixel.dispose}
    @light.dispose
  end
  #--------------------------------------------------------------------------
  # * Aggiornamento della grandezza
  #--------------------------------------------------------------------------
  def update_size
    @fake_sprite.update
    @view2.rect.width = @fake_sprite.x
    @light.x = @fill.x + @view2.rect.width
    return if @value == $game_party.sinergic_state
    @value = $game_party.sinergic_state
    @fake_sprite.smooth_move(fill_width(@value), 0, 3)
  end
  #--------------------------------------------------------------------------
  # * Flash dello sfondo
  #--------------------------------------------------------------------------
  def flash_bar
    if Graphics.frame_count % 30 == 0
      @background.flash(Color.new(255,255,255,100),30)
    end
  end
  #--------------------------------------------------------------------------
  # * Aggiornamento dell'animazione della barra
  #--------------------------------------------------------------------------
  def update_animation
    @power.ox -= 2
    @power.oy += 1
    @power2.ox -= 1
    @power2.oy -= 1
  end
  #--------------------------------------------------------------------------
  # * Controllo dell'attivazione
  #--------------------------------------------------------------------------
  def update_activation
    $game_party.sinergy_active? ? activate : deactivate
  end
  #--------------------------------------------------------------------------
  # * Attivazione
  #--------------------------------------------------------------------------
  def activate
    return if @active
    RPG::SE.new(ACTIV_SOUND).play
    color = Color.new(255,255,255)
    @background.flash(color, 60)
    @fill.flash(color, 60)
    @corner.flash(color, 60)
    @background.tone = B_ACTV_TONE
    @fill.tone = ACTIVE_TONE
    @light.tone = ACTIVE_TONE
    @active = true
  end  
  #--------------------------------------------------------------------------
  # * Disattivazione della Sinergia
  #--------------------------------------------------------------------------
  def deactivate
    return unless @active
    default_tone = Tone.new(0,0,0,0)
    @background.tone = B_DEFT_TONE
    @fill.tone = default_tone
    @light.tone = default_tone
  end
end #sinergysprite
