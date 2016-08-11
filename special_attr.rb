#==============================================================================
# ** ATTRIBUTI AGGIUNTIVI di Holy87
# -----------------------------------------------------------------------------
# Descrizione:
# Questo script i serve per aggiungere effetti speciali ad armi, skill e stati.
# -----------------------------------------------------------------------------
# Codici:
#▼ EVOCAZIONI
# ● <evoca: x> evoca l'eroe x
# ● <bonus evocazione: +x%> aumenta la durata delle evocazioni del x percento
# ● <ricarica esper> solo per le evocazioni, l'evocazione dura più a lungo
#   quando subisce danni
# ● <vlink> sullo status usato come boost della dominazione: prende il 25% dei
#   danni dell'evocatore
# ● <bonus ricarica: x%> la ricarica della dominazione impiega -x% battaglie
# ● <salva dominazione> se muore la dominazione non si dovrà aspettare il doppio
#   delle battaglie
#▼ UTILITY ESPLORAZIONE
# ● <virile> ha virilità (sposta i blocchi più velocemente)
# ● <artificiere> disattiva le trappole
# ● <scassinatore> scassina le serrature
# ● <carisma: +x%> sconto sugli oggetti del x%
# ● <salto lungo> se un eroe con questo tag è nel gruppo, si può saltare più
#   lontano.
# ● <oggetto bonus: x%> x% di probabilità di creare un oggetto bonus nelle
#   trasmutazioni
#▼ SINERGIA
# ● <incentivo: +x> comincia la barra sinergia con x quantità piena (1000 max)
# ● <durata sinergia: +x%> incrementa la durata della sinergia del x%
# ● <bonus sinergia: x%> la sinergia si carica più velocemente del x%
# ● <sinergia: x> l'abilità carica x sinergia invece del valore di default
#▼ FURIA
# ● <ira: +/-x> aumenta o diminuisce l'ira che si ottiene attaccando
# ● <ira max: +/-x> aumenta o diminuisce l'ira massima
# ● <ira iniziale: +/-x> aumenta o diminuisce l'ira iniziale
# ● <incremento ira: +/-x> l'abilità incrementa l'ira di x
# ● <danno ira> l'ira aumenta anche se si viene colpiti
# ● <ira kill: x> Aumenta l'ira di x quando uccidi un nemico
# ● <mantieni ira: +/-x> l'ira si scarica di meno camminando
# ● <ira turno: +/-x> Aggiunge o rimuove Ira ad ogni turno.
#▼ QUALITÀ
# ● <difensore> chi ha questo status subisce il 20% dei danni di un alleato
# ● <vlink> l'evocazione con questo status prende il 15% dei danni degli alleati
# ● <salva oggetto: x%> x% di probabilità di non consumare l'oggetto
# ● <taumaturgia> le skill con questo tag possono essere usate anche dal menu
#   se l'eroe ha uno stato con questo tag
# ● <ritmo> quando si canta consecutivamente 3 canzoni o più, la velocità
#   viene incrementata del 50%. Scompare se si fanno altre azioni
#   (la skill deve avere il tag <tipo: Canto>)
# ● <ultima chance> per una volta nella battaglia, se subisce un colpo mortale
#   l'eroe resta con 1PV invece di morire.
#▼ PARAMETRI
# ● <dona x: y%> dona il parametro x dell'y%, solo status
# ● <pv vittoria: x%> cura il X% di pv alla vittoria
# ● <pm vittoria: x%> cura il X% di pm alla vittoria
# ● <rifletti fis: x%> riflette x% di danno fisico
# ● <mastery x: +y% z> il parametro z aumenta dell'y% quando possiede l'equip di
#   tipo x
# ● <vampiro x%>: assorbe il x% dei danni curandosi
# ● <danno stato x: y%> y% di probabilità di attivare lo stato x quando si
#   subisce un danno
# ● <attacco stato x: y%> y% di probabilità di attivare lo stato x quando si
#   attacca il nemico
# ● <bonus party x: +y%> il parametro x del gruppo aumenta del y% se l'eroe con
#   questo tag è presente in battaglia. x: atk, def, spi, agi, cri, eva, hit
# ● <costo mp: +/-x%> il costo delle abilità viene modificato del x%
# ● <costo x: +/-y%>  il costo dell'abilità di tipo x viene modificato del x%>
# ● <rate magico: +/-x%> aumenta o diminuisce il danno magico ricevuto
# ● <difesa magica: +/-x%> l'inverso del rate magico
# ● <danno magico: +/-x%> Danno magico inflitto
# ● <difesa critici: +/-x%> aumenta o diminuisce le probabilità di subire
#   danni critici dell'x% (NON FUNZIONA)
# ● <mod danno: +/-x%> aumenta o diminuisce il danno ricevuto in percentuale.
# ● <cura: +/-x%> aumenta o diminuisce la quantità di cure subite
# ● <danno critico: +/-x%> aumenta o diminuisce il danno degli attacchi critici
# ● <incrementa x: +/-y> aumenta il parametro x di y per la durata della battaglia
# ● <nome guardia: x> cambia il nome del comando Difendi
# ● <nome attacca: x> cambia il nome del comando Attacca
#   (non funziona perché c'è già quello di Yanfly)
#▼ STATUS
# ● <status attacco: x> aggiunge lo status X all'attacco
# ● <status rimosso: x> rimuove lo status X all'attacco
# ● <spirattacco: x%> aggiunge all'attacco il x% del proprio spirito
# ● <buff> o <debuff> per impostare uno status positivo o negativo.
# ● <bonus stati: +/-x> aumenta la potenza di riuscita dello status di x
# ● <bonus stati: +/-x%> aumenta la potenza di riuscita dello status del x%
# ● <durata stati inflitti: +/-x> aumenta la durata degli status che l'eroe inf.
#▼ POTERI E OGGETTI
# ● <h+x> l'help aggiunge x
# ● <virale> lo status è virale e viene trasmesso.
# ● <spiritolite> l'oggetto è una spiritolite
# ● <rimuovi stato: x> rimuove lo stato x, ma non funziona ancora
# ● <bombifica> status che fa esplodere il nemico alla morte
# ● <odio tank: +/-x> aumenta o diminuisce l'odio del tank.
#   Il tank in gruppo è Francesco, se assente è Larsa, altrimenti Maria Rosaria.
#   Infine Michele.
# ● <sk_type: x> assegna il tipo di abilità (per il costo)
# ● <troop: x> l'oggetto è un gruppo di mostri in uno scrigno.
# ● <jappo: x> ha un nome giapponese. Per le skill di Ryusei.
#==============================================================================

module H87AttrSettings
  Charge_Actors = [3,4,8,9] #eroi che hanno la barra charge invece di quella MP
  Default_Charge_Max = 100
  Anger_Incr = 10
  TANKS = [21,1,13,7]#i tank in ordine di priorità
  HEALERS = [6,19,11,1,6,15,7]#i guaritori in ordine di priorità
  NUKERS = [2,13,10,7]

  VLINK_RATE = 0.15
  
  MAX_PARAMS = {
    'mhp' => 5000,
    'mmp' => 500,
    'atk' => 500,
    'def' => 500,
    'spi' => 500,
    'agi' => 500,
    'cri' => 50,
    'eva' => 50,
    'hit' => 50
  }
  
  PARAMS_CAN_ZERO = ['cri', 'eva', 'hit']
end

#==============================================================================
# ** ExtraAttr
#---------------------------------------------------------------------------
#  Contiene le stringhe per gli attributi
#==============================================================================
module ExtraAttr

  DOM_BONUS = /<(?:BONUS_EVOCAZIONE|bonus evocazione):[ ]*(\d+)([%％])>/i
  VIRIL     = /<(?:VIRILE|virile)>/i
  ARTIFICIS = /<(?:ARTIFICIERE|artificiere)>/i
  SCASSINATE= /<(?:SCASSINATORE|scassinatore)>/i
  CHARM     = /<(?:CARISMA|carisma):[ ]*([\+\-]\d+)>/i
  DEFENDER  = /<(?:DIFENSORE|difensore)>/i
  SIN_INCR  = /<(?:SINERGIA|sinergia):[ ]*(\d+)>/i
  STATE_DMG = /<(?:DANNO_STATO|danno stato)[ ]*(\d+):[ ]*(\d+)([%％])>/i
  STATE_HIT = /<(?:ATTACCO_STATO|attacco stato)[ ]*(\d+):[ ]*(\d+)([%％])>/i
  EVOCATION = /<(?:EVOCA|evoca):[ ]*(\d+)>/i
  ESPER_REC = /<(?:RICARICA_ESPER|ricarica esper)>/i
  ITEM_SAVE = /<(?:SALVA_OGGETTO|salva oggetto):[ ]*(\d+)([%％])>/i
  FAST_READY= /<(?:BONUS_RICARICA|bonus ricarica):[ ]*(\d+)([%％])>/i
  SAVE_DOMI = /<(?:SALVA_DOMINAZIONE|salva dominazione):[ ]*(\d+)>/i
  TAUMATURG = /<(?:TAUMATURGIA|taumaturgia)>/i
  ITEM_BON  = /<(?:OGGETTO_BONUS|oggetto bonus):[ ]*(\d+)([%％])>/i
  ATB_BONUS = /<(?:BONUS_ATB|bonus atb)>/i
  ATB_SONG  = /<(?:ATB_CANZONE|atb canzone)>/i
  LONG_JUMP = /<(?:SALTO_LUNGO|salto lungo)>/i
  VAMPIRE_A = /<vampiro[ ]+(\d+)%>/i
  RHYTM     = /<(?:RITMO|ritmo)>/i
  PARTY_BON = /<(?:BONUS_PARTY|bonus party)[ ](.*)>:[ ]*(\d+)([%％])>/i
  MP_RATE   = /<(?:COSTO_MP|costo mp):[ ]*([\+\-]\d+)([%％])>/i
  HELP_STRT = /<help>/i
  HELP_END  = /<\/help>/i
  VLINK     = /<vlink>/i
  SET_SKILL = /<skills:[ ]*(\d+(?:\s*,\s*\d+)*)>/i
  VIRAL     = /<virale>/i
  HEAL_RATE = /<cura:[ ]*([\+\-]\d+)[%％]>/i
  BOMBER    = /<bombifica>/i
  SPIRITOL  = /<spiritolite>/i
  REM_STATE = /<rimuovi stato:[ ]+(\d+)>/i
  MAG_RATE  = /<rate magico:[ ]*([\+\-]\d+)([%％])>/i
  MAG_DAMG  = /<danno magico:[ ]*([\+\-]\d+)([%％])>/i
  MAG_DEFR  = /<difesa magica:[ ]*([\+\-]\d+)([%％])>/i
  PAR_GIFT  = /<dona (.+):[ ]*(\d+)([%％])>/i
  PHIS_REF  = /<rifletti fis:[ ]*(\d+)([%％])>/i
  PARTY_ABS = /<assorbi gruppo>/i
  ANGER_AMM = /<ira:[ ]*([\+\-]\d+)>/i
  ANGER_MAX = /<ira max:[ ]*([\+\-]\d+)>/i
  ANGER_COST= /<costo ira:[ ]*(\d+)>/i
  ANGER_INIT= /<ira iniziale:[ ]*(\d+)>/i
  ANGER_RATE= /<incremento ira:[ ]*([\+\-]\d+)>/i
  ANGER_MANT= /<mantieni ira:[ ]*([\+\-]\d+)>/i
  ANGER_TURN= /<ira turno:[ ]*([\+\-]\d+)>/i
  ANGER_DAMG= /<danno ira>/i
  ANGER_KILL= /<ira kill:[ ]*(\d+)>/i
  MAX_NUMBER= /<num massimo:[ ]*(\d+)>/i
  TANK_ODDS = /<odio tank:[ ]*([\+\-]\d+)>/i
  ATK_P_STA = /<status attacco:[ ]*(\d+)>/i
  ATK_M_STA = /<status rimosso:[ ]*(\d+)>/i
  SPI_ATK   = /<spirattacco:[ ]*([\+\-]\d+)([%％])>/i
  WIN_HP    = /<pv vittoria:[ ]*(\d+)([%％])>/i
  WIN_MP    = /<pm vittoria:[ ]*(\d+)([%％])>/i
  CRI_DEF   = /<difesa critici:[ ]*(\d+)([%％])>/i
  DMG_MOD   = /<modificatore danno:[ ]*(\d+)([%％])>/i
  TR_BUFF   = /<buff>/i
  TR_DEBUFF = /<debuff>/i
  STAT_INCR = /<incrementa[ ]*(.+):[ ]*([\+\-]\d+)>/i
  BUFF_BONUS= /<durata buff:[ ]*([\+\-]\d+)([%％])>/i
  DEBF_MALUS= /<durata debuff:[ ]*([\+\-]\d+)([%％])>/i
  STATE_BON = /<bonus stati:[ ]*([\+\-]\d+)>/i
  ST_BON_PER= /<bonus stati:[ ]*([\+\-]\d+)%>/i
  ST_BON_IGN= /<ignora bonus stati>/i
  ST_INF_DUR= /<durata stati inflitti:[ ]*([\+\-]\d+)>/i
  SK_COST_TP= /<costo[ ]*(.):[ ]*([\+\-]\d+)%>/i
  SK_TYPE_CS= /<sk_type:[ ]*(.)>/i
  MASTERY   = /<mastery (.+):[ ]*([\+\-]\d+)%[ ]*(.+)>/i
  MONSTER_T = /<troop:[ ]*(\d+)>/i
  TRADE_LOCK= /<blocca scambi>/i
  GUARD_TEXT = /<nome guardia:[ ]*(.+)>/i
  ATTACK_TEXT = /<nome attacca:[ ]*(.+)>/i
  LAST_CHANCE = /<ultima chance>/i
  JAPANESE_NM = /<jappo:[ ]*(.+)>/i
  RARITY_CLASS = /<rarità[ ]+(\d+)>/i
  ALLOW_EQUIP = /<permetti equip[ ]+(.+)>/i
  SYNTH_BONUS = /<cura:[ ]*([\+\-]\d+)[%％]>/i
  REC_SKILLS  = /<ricarica skills>/i
  EQIP_LEVEL = /<livello:[ ]+(\d+)>/i
  CRIT_DMG  = /<danno critico:[ ]*([\+\-]\d+)([%％])>/i
  SET_BONUS = /<set bonus>/i
  #--------------------------------------------------------------------------
  # * Variabili di istanza pubblici
  #--------------------------------------------------------------------------
  attr_reader :dom_bonus
  attr_reader :viril
  attr_reader :artificis
  attr_reader :scassinate
  attr_reader :charm
  attr_reader :defender
  attr_reader :status_hit
  attr_reader :status_hit_prob
  attr_reader :status_dmg
  attr_reader :status_dmg_prob
  attr_reader :esper_recharger
  attr_reader :item_save
  attr_reader :fast_ready
  attr_reader :save_domination
  attr_reader :taumaturgic
  attr_reader :item_bonus
  attr_reader :atb_bonus              
  attr_reader :atb_song               #passiva che velocizza se è una canzone
  attr_reader :long_jump              #status salto lungo
  attr_reader :rhytm                  #status ritmo
  attr_reader :mp_rate                #costo PM delle abilità
  attr_reader :party_bonus            #bonus parametri al gruppo (vedere poi)
  attr_reader :vlink                  #link vitale (prende % di danni dagli ally)
  attr_reader :viral                  #status virale (si contagia)
  attr_reader :minus_state_set        #non usato (forse)
  attr_reader :attack_plus_states     #aggiunge stati con l'attacco
  attr_reader :attack_minus_states    #rimuove stati con l'attacco
  attr_reader :vampire_rate           #% di danni assorbiti con qualsiasi danno
  attr_reader :skill_set              #non è più usato
  attr_reader :bombifica              #skill che trasforma nemici in bombe
  attr_reader :magic_def              #difesa magica (% di danno subìto)
  attr_reader :magic_dmg              #attacco magico (% bonus di danno inflitto)
  attr_reader :param_gift             #% di dono dei propri parametri agli alleati
  attr_reader :physical_reflect       #% di danni fisici riflessi al nemico
  attr_reader :anger_bonus            #incremento furia acquisita attaccando
  attr_reader :max_anger_bonus        #incremento furia massima
  attr_reader :anger_init             #furia iniziale
  attr_reader :anger_damage           #furia acquisita dopo aver subito un colpo
  attr_reader :anger_mantain          #mantenimento furia dopo un combattimento
  attr_reader :anger_kill             #furia caricata dopo un'uccisione
  attr_reader :anger_turn             #furia che si carica ad ogni turno
  attr_reader :max_number             #numero massimo di oggetti trasportabili
  attr_reader :spirit_attack          #% di spirito che incrementa l'attacco
  attr_reader :hp_on_win              #% di pv curati alla vittoria
  attr_reader :mp_on_win              #% di pm curati dopo una vittoria
  attr_reader :masteries              #bonus maestria per equipaggiamento
  attr_reader :state_def_bonus        #bonus per infliggere status
  attr_reader :state_inflict_perc     #bonus in percentuale dello status
  attr_reader :ignore_bonus           #ignora bonus
  attr_reader :buff_durability        #durata buff
  attr_reader :debuff_durability      #durata debuff
  attr_reader :state_inflict_durability#addizionatore turni di status inflitto
  attr_reader :skill_type_cost        #modificatore costo per un tipo di skill
  attr_reader :trade_lock             #l'equipaggiamento non è scambiabile
  attr_reader :guard_text             #testo guardia
  attr_reader :attack_text            #testo attacca
  attr_reader :last_chance            #ultima chance
  attr_reader :critical_defense       #difesa colpi critici
  attr_reader :damage_rate            #rateo di danno ricevuto
  attr_reader :japanese_name          #nome giapponese
  attr_reader :rarity                 #grado di rarità
  attr_reader :allow_equip_type       #permette un tipo di equipaggiamento
  attr_reader :synth_bonus            #bonus sintesi
  attr_reader :equip_level            #livello equipaggiamento
  attr_reader :critical_damage        #modificatore danno critico
  attr_reader :set_bonus              #se lo stato è attivato da un set equip
  #--------------------------------------------------------------------------
  # * Carica gli attributi aggiuntivi dell'oggetto dal tag delle note
  #--------------------------------------------------------------------------
  def load_extra_attr
    return if @attributi_caricati
    @description = '' if @description.nil?
    @equip_level = 0
    @attributi_caricati = true
    @dom_bonus = 0
    @viril = false
    @artificis = false
    @scassinate = false
    @charm = 0
    @set_bonus = false
    @minus_state_set = []
    @param_gift = {:atk => 0, :def => 0, :spi => 0, :agi => 0}
    @status_hit = 0
    @bombifica = false
    @status_hit_prob = 0
    @status_dmg = 0
    @status_dmg_prob = 0
    @fast_ready = 0
    @anger_damage = false
    @esper_recharger = false
    @defender = false
    @vampire_rate = 0
    @item_save = 0
    @anger_bonus = 0
    @anger_mantain = 0
    @max_anger_bonus = 0
    @save_domination = false
    @taumaturgic = false
    @item_bonus = 0
    @physical_reflect = 0
    @anger_init = 0
    @magic_def = 0.0
    @magic_dmg = 0.0
    @atb_bonus = 0
    @atb_song = 0
    @skill_set = []
    @rhytm = false
    @long_jump = false
    @mp_rate = 0.0
    @anger_kill = 0
    @vlink = false
    @viral = false
    @party_bonus = {}
    @anger_turn = 0
    @max_number = 99
    @attack_plus_states = []
    @attack_minus_states = []
    @spirit_attack = 0
    @hp_on_win = 0.0
    @mp_on_win = 0.0
    @buff_type = :none
    @state_def_bonus = 0
    @state_inflict_perc = 0
    @buff_durability = 0.0
    @debuff_durability = 0.0
    @last_chance = false
    @ignore_bonus = false
    @state_inflict_durability = 0.0
    @stat_increment = {}
    @skill_type_cost = {}
    @masteries = {}
    @trade_lock = false
    @critical_defense = 0
    @damage_rate = 0.0
    @rarity = 1
    @synth_bonus = 0
    @critical_damage = 0.0
    @allow_equip_type = []
    reading_help = false
    self.note.split(/[\r\n]+/).each { |riga|
      if reading_help
        if riga =~ HELP_END
          reading_help = false
        else
          @description += riga
        end
        next
      end
      case riga
        when DOM_BONUS
          @dom_bonus = $1.to_f/100
        when VIRIL
          @viril = true
        when ARTIFICIS
          @artificis = true
        when SCASSINATE
          @scassinate = true
        when CHARM
          @charm = $1.to_i
        when DEFENDER
          @defender = true
        when STATE_DMG
          @status_dmg = $1.to_i
          @status_dmg_prob = $2.to_f/100
        when STATE_HIT
          @status_hit = $1.to_i
          @status_hit_prob = $2.to_f/100
        when ESPER_REC
          @esper_recharger = true
        when ITEM_SAVE
          @item_save = $1.to_f/100
        when FAST_READY
          @fast_ready = $1.to_i
        when SAVE_DOMI
          @save_domination = true
        when TAUMATURG
          @taumaturgic = true
        when ITEM_BON
          @item_bonus = $1.to_f/100
        when ATB_BONUS
          @atb_bonus = $1.to_i
        when ATB_SONG
          @atb_song = $1.to_i
        when LONG_JUMP
          @long_jump = true
        when RHYTM
          @rhytm = true
        when MP_RATE
          @mp_rate = $1.to_f/100.0
        when HELP_STRT
          reading_help = true
        when VLINK
          @vlink = true
        when VIRAL
          @viral = true
        when VAMPIRE_A
          @vampire_rate += $1.to_i
        when REM_STATE
          @minus_state_set.push($1.to_i)
        when SET_SKILL
          $1.scan(/\d+/).each { |num|
            @skill_set.push(num.to_i) if num.to_i > 0 }
        when PARTY_BON
          param = $1.to_sym
          if [:atk, :def, :spi, :agi, :cri, :eva, :hit].include?(param)
            @party_bonus[param] = $2.to_f/100.0
          end
        when BOMBER
          @bombifica = true
        when MAG_RATE
          @magic_def -= $1.to_f/100.0
        when MAG_DEFR
          @magic_def += $1.to_f/100.0
        when MAG_DAMG
          @magic_dmg += $1.to_f/100.0
        when PAR_GIFT
          @param_gift[$1] = $2.to_f/100.0
        when PHIS_REF
          @physical_reflect = $1.to_f/100.0
        when ANGER_AMM
          @anger_bonus = $1.to_i
        when ANGER_MAX
          @max_anger_bonus = $1.to_i
        when ANGER_INIT
          @anger_init = $1.to_i
        when ANGER_DAMG
          @anger_damage = true
        when ANGER_MANT
          @anger_mantain = $1.to_i
        when ANGER_KILL
          @anger_kill += $1.to_i
        when ANGER_TURN
          @anger_turn += $1.to_i
        when MAX_NUMBER
          @max_number = $1.to_i
        when ATK_P_STA
          @attack_plus_states.push($1.to_i)
        when ATK_M_STA
          @attack_minus_states.push($1.to_i)
        when SPI_ATK
          @spirit_attack += $1.to_f/100.0
        when WIN_HP
          @hp_on_win += $1.to_f/100.0
        when WIN_MP
          @mp_on_win += $1.to_f/100.0
        when TR_BUFF
          @buff_type = :buff
        when TR_DEBUFF
          @buff_type = :debuff
        when BUFF_BONUS
          @buff_durability += $1.to_f/100.0
        when DEBF_MALUS
          @debuff_durability += $1.to_f/100.0
        when ST_INF_DUR
          @state_inflict_durability += $1.to_f/100.0
        when STATE_BON
          @state_def_bonus = $1.to_i
        when ST_BON_PER
          @state_inflict_perc = $1.to_i
        when ST_BON_IGN
          @ignore_bonus = true
        when ST_INF_DUR
          @state_inflict_durability = $1.to_f/100.0
        when SK_COST_TP
          @skill_type_cost[$1] = $2/100.0
        when TRADE_LOCK
          @trade_lock = true
        when MASTERY
          e_type = $1
          value = $2.to_i
          @mastery[$3.to_sym] = MasteryInfo.new(e_type, value)
        when GUARD_TEXT
          @guard_text = $1
        when ATTACK_TEXT
          @attack_text = $1
        when CRI_DEF
          @critical_defense = $1.to_i
        when DMG_MOD
          @damage_rate = $1.to_f/100.0
        when JAPANESE_NM
          @japanese_name = $1
        when RARITY_CLASS
          @rarity = $1.to_i
        when ALLOW_EQUIP
          @allow_equip_type.push($1)
        when SYNTH_BONUS
          @synth_bonus += $1.to_i
        when EQIP_LEVEL
          @equip_level = $1.to_i
        when CRIT_DMG
          @critical_damage = $1.to_f/100
        when SET_BONUS
          @set_bonus = true
        when LAST_CHANCE
          @last_chance = true
      end
    }
  end
  #--------------------------------------------------------------------------
  # * restituisce il moltiplicatore costo di una certa abilità
  #--------------------------------------------------------------------------
  def cost_skill(value)
    return 0 if @skill_type_cost[value].nil?
    @skill_type_cost[value]
  end

  def mastery(param, e_type)
    return 0 if @mastery[param].nil?
    return 0 if @mastery[param].e_type != e_type
    @mastery[param].value
  end
  #--------------------------------------------------------------------------
  # * Restituisce true se è scambiabile tra giocatori
  #--------------------------------------------------------------------------
  def traddable?
    return false if self.price == 0
    return false if @trade_lock
    true
  end
  #--------------------------------------------------------------------------
  # * Determina se l'equipaggiamento non si può disequipaggiare
  #--------------------------------------------------------------------------
  def equip_locked?; false; end
end

module RPG
  #==============================================================================
  # ** RPG::EquippableItem
  #---------------------------------------------------------------------------
  #  Inserisce gli attributi appropiati agli oggetti equipaggiabili
  #==============================================================================
  class Weapon < BaseItem
    include ExtraAttr

  end #equippableitem

  #==============================================================================
  # ** RPG::Armor
  #---------------------------------------------------------------------------
  #  Inserisce gli attributi appropiati agli oggetti equipaggiabili
  #==============================================================================
  class Armor < BaseItem
    include ExtraAttr
  end #equippableitem

  #==============================================================================
  # ** RPG::State
  #---------------------------------------------------------------------------
  #  Inserisce gli attributi appropiati per gli stati alterati
  #==============================================================================
  class State
    attr_reader :description
    include ExtraAttr
    #--------------------------------------------------------------------------
    # * True se lo status è un buff
    #--------------------------------------------------------------------------
    def buff?; @buff_type == :buff; end
    #--------------------------------------------------------------------------
    # * True se lo status è un debuff
    #--------------------------------------------------------------------------
    def debuff?; @buff_type == :debuff; end
  end #state

  #==============================================================================
  # ** RPG::Enemy
  #---------------------------------------------------------------------------
  #  Inserisce gli attributi appropiati per i nemici
  #==============================================================================
  class Enemy
    attr_reader :description
    include ExtraAttr
  end

  #==============================================================================
  # ** RPG::Skill
  #---------------------------------------------------------------------------
  #  Imposta gli attributi per le abilità
  #==============================================================================
  class UsableItem
    attr_reader :syn_bonus            #bonus sinergia (NON USATO)
    attr_reader :esper                #esper evocato
    attr_reader :spiritolite          #spiritolite
    attr_reader :absorb_damage_party  #assorbi danno e dona al gruppo
    attr_reader :anger_cost           #costo ira
    attr_reader :anger_rate           #carica ira
    attr_reader :tank_odd             #aggro al tank
    attr_reader :state_inf_bonus      #bonus probabilità infliggi status
    attr_reader :state_inflict_perc   #bonus probabilità infliggi status perc.
    attr_reader :state_durab_bonus    #bonus durata status
    attr_reader :ignore_bonus         #ignora bonus
    attr_reader :sk_types             #tipo di abilità (per costo)
    #--------------------------------------------------------------------------
    # * Inizializza il livello della classe dell'oggetto
    #--------------------------------------------------------------------------
    def load_extra_attr
      return if @cache_caricatasyn
      @cache_caricatasyn = true
      @syn_bonus = 0
      @esper = 0
      @absorb_damage_party = false
      @anger_cost = 0
      @state_durab_bonus = 0
      @spiritolite = false
      @ok_with_taumaturgic = false
      @anger_rate = 0
      @max_number = 99
      @tank_odd = 0
      @stat_increment = {}
      @state_inf_bonus = 0
      @state_inflict_perc = 0
      @ignore_bonus = false
      @sk_types = []
      @troop_id = 0
      @trade_lock = false
      @recharge_skills = false
      self.note.split(/[\r\n]+/).each { |riga|
        case riga
          when ExtraAttr::SIN_INCR
            @syn_bonus = $1.to_i
          when ExtraAttr::EVOCATION
            @esper = $1.to_i
          when ExtraAttr::TAUMATURG
            @ok_with_taumaturgic = true
          when ExtraAttr::SPIRITOL
            @spiritolite = true
          when ExtraAttr::PARTY_ABS
            @absorb_damage_party = true
          when ExtraAttr::ANGER_COST
            @anger_cost = $1.to_i
          when ExtraAttr::ANGER_RATE
            @anger_rate = $1.to_i
          when ExtraAttr::MAX_NUMBER
            @max_number = $1.to_i
          when ExtraAttr::TANK_ODDS
            @tank_odd += $1.to_i
          when ExtraAttr::STATE_BON
            @state_inf_bonus = $1.to_i
          when ExtraAttr::ST_BON_PER
            @state_inflict_perc = $1.to_i
          when ExtraAttr::ST_BON_IGN
            @ignore_bonus = true
          when ExtraAttr::SK_TYPE_CS
            @sk_types.push($1)
          when ExtraAttr::MONSTER_T
            @troop_id = $1.to_i
          when ExtraAttr::TRADE_LOCK
            @trade_lock = true
          when ExtraAttr::STAT_INCR
            @stat_increment[$1] = $2.to_i
          when ExtraAttr::REC_SKILLS
            @recharge_skills = true
          else
            # type code here
        end
      }
    end
    #--------------------------------------------------------------------------
    # * Restituisce se la skill può essere usata dalla taumaturgia
    #--------------------------------------------------------------------------
    def can_tau?; @ok_with_taumaturgic; end
    #--------------------------------------------------------------------------
    # * Restituisce true se la skill ha un certo tipo
    #--------------------------------------------------------------------------
    def type?(type); @sk_types.include?(type); end
    #--------------------------------------------------------------------------
    # * Restituisce l'incremento di un determinato parametro
    # @param [String] stat
    # @return [Integer]
    #--------------------------------------------------------------------------
    def param_increment(stat)
      return 0 if @stat_increment[stat].nil?
      @stat_increment[stat]
    end
    #--------------------------------------------------------------------------
    # * Determina se l'oggetto incrementa un parametro
    #--------------------------------------------------------------------------
    def increases_param?
      @stat_increment.size > 0
    end
    #--------------------------------------------------------------------------
    # * Determina se l'oggetto ricarica tutte le skill
    #--------------------------------------------------------------------------
    def skill_recharge?; @recharge_skills; end
  end #usable item

  #==============================================================================
  # ** RPG::Skill
  #---------------------------------------------------------------------------
  #  Classe che contiene le informazioni sulle abilità
  #==============================================================================
  class Skill < UsableItem
    #--------------------------------------------------------------------------
    # * Riscrittura di menu_ok?
    #--------------------------------------------------------------------------
    def menu_ok?; can_tau? ? true : super; end
    #--------------------------------------------------------------------------
    # * Restituisce il nome dell'abilità
    #--------------------------------------------------------------------------
    #def name
    #  return @name unless @japanese_name
    #  return @name unless japanese_active?
    #  return @japanese_name
    #end
  end

  #==============================================================================
  # ** RPG::Item
  #---------------------------------------------------------------------------
  #  Classe che contiene le informazioni sugli oggetti
  #==============================================================================
  class Item < UsableItem
    attr_reader :max_number   #numero massimo
    attr_reader :troop_id     #ID dei mostri
    attr_reader :trade_lock   #non permette lo scambio tra giocatori
    #--------------------------------------------------------------------------
    # * Restituisce true se è scambiabile tra giocatori
    #--------------------------------------------------------------------------
    def traddable?
      return false if self.key_item   #non traddabile se è una chiave
      return false if self.price == 0 #non traddabile se il prezzo è 0
      return false if @trade_lock     #non traddabile se bloccato da tag
      true                            #traddabile
    end
  end
end
#==============================================================================
# ** MasteryInfo
#---------------------------------------------------------------------------
#  Classe che contiene le informazioni sulla mastery
#==============================================================================
class MasteryInfo
  attr_reader :e_type #tipo equip
  attr_reader :value  #valore
  #--------------------------------------------------------------------------
  # * Inizializzazione
  #--------------------------------------------------------------------------
  def initialize(e_type, value)
    @e_type = e_type
    @value = value
  end
end

#==============================================================================
# ** Scene_Title
#---------------------------------------------------------------------------
#  Aggiunta del caricamento degli attributi
#==============================================================================
class Scene_Title < Scene_Base
  #--------------------------------------------------------------------------
  # * Alias di load_database
  #--------------------------------------------------------------------------
  alias attr_agg_load_database load_database unless $@
  def load_database
    attr_agg_load_database
    check_extra_attributes
  end
  #--------------------------------------------------------------------------
  # * Alias di load_battle_test_database
  #--------------------------------------------------------------------------
  alias attr_load_battle_test_database load_bt_database unless $@
  def load_bt_database
    attr_load_battle_test_database
    check_extra_attributes
  end
  #--------------------------------------------------------------------------
  # * Carica i dati degli oggetti
  #   collection: collezione di oggetti
  #--------------------------------------------------------------------------
  def parse_bm_data(collection)
    collection.each{|obj| next if obj.nil?; obj.load_extra_attr}
  end
  #--------------------------------------------------------------------------
  # * Carica gli attributi extra
  #--------------------------------------------------------------------------
  def check_extra_attributes
    parse_bm_data($data_skills)
    parse_bm_data($data_items)
    parse_bm_data($data_weapons)
    parse_bm_data($data_armors)
    parse_bm_data($data_states)
    parse_bm_data($data_enemies)
  end
end #scene_title

#==============================================================================
# ** Game_Battler
#---------------------------------------------------------------------------
#  Vari metodi per il combattente
#==============================================================================
class Game_Battler
  unless $@
    alias h87attr_att_eff attack_effect
    alias h87attr_skill_effect skill_effect
    alias h87attr_plus_state_set plus_state_set
    alias h87attr_minus_state_set minus_state_set
    alias make_attack_damage_value_ht make_attack_damage_value
    alias make_obj_damage_value_ht make_obj_damage_value
    alias h87attr_item_effect item_effect
    alias run_cdf2 run_cdf
    alias tau_mp_cost calc_mp_cost
    alias h87attr_item_test item_test
    alias h87_attr_state_prob state_probability
    alias h87status_as add_state
    alias h87attr_hp hp=
  end

  attr_accessor :last_damage
  attr_accessor :cumuled_damage
  #--------------------------------------------------------------------------
  # * Attributi statici (modificati poi nelle sottoclassi)
  #--------------------------------------------------------------------------
  def vampire_rate; 0; end            #vampire rate
  def taumaturgic?; fase; end         #taumaturgico?
  def charge_gauge?; false; end       #usa la furia?
  def has2w; false; end               #ha due armi?
  def bombified?; false; end          #bomba?
  #--------------------------------------------------------------------------
  # * Inizializza le variabili ad inizio battaglia
  #--------------------------------------------------------------------------
  def init_for_battle
    check_last_chance
    self.last_damage = 0
    self.cumuled_damage = 0
  end
  #--------------------------------------------------------------------------
  # * Restituisce le feature
  #--------------------------------------------------------------------------
  def features; states; end
  #--------------------------------------------------------------------------
  # * Restituisce la somma di un attributo delle caratteristiche
  #--------------------------------------------------------------------------
  def features_sum(feature_name, param = nil)
    sum = 0
    features.each{|ft| sum += eval("ft.#{feature_name}#{param}")}
    sum
  end
  #--------------------------------------------------------------------------
  # * Restituisce un valore da un array
  #--------------------------------------------------------------------------
  def feature_array(feature_name, param = nil)
    sum = []
    features.each{|ft| sum += eval("ft.#{feature_name}#{param}")}
    sum
  end
  #--------------------------------------------------------------------------
  # * Restituisce true se tra le caratteristiche ce n'è una con un attributo
  #--------------------------------------------------------------------------
  def has_feature?(feature_name, param = nil)
    features.each{|ft| return true if eval("ft.#{feature_name}#{param}")}
    false
  end
  #--------------------------------------------------------------------------
  # * Restituisce l'incremento in battaglia di un determinato parametro
  # @param [String] param
  # @return [Integer, Float]
  #--------------------------------------------------------------------------
  def increased_param(param)
    @increased_params = {} if @increased_params.nil?
    return 0 if @increased_params[param].nil?
    @increased_params[param]
  end
  #--------------------------------------------------------------------------
  # * Incrementa un parametro
  # @param [String] param
  # @param [Integer, Float] value
  # @param [Boolean] overbuff se può aumentare oltre il limite 
  #--------------------------------------------------------------------------
  def param_incr(param, value, overbuff = false)
    @increased_params = {} if @increased_params.nil?
    @increased_params[param] = 0 if @increased_params[param].nil?
    @increased_params[param] += value
  end
  #--------------------------------------------------------------------------
  # * Resetta i parametri (dopo la fine della battaglia)
  #--------------------------------------------------------------------------
  def reset_params
    @increased_params = {}
  end
  #--------------------------------------------------------------------------
  # * modifica del valore critico
  #--------------------------------------------------------------------------
  def cri;party_bonus(ex_attr_cri, :cri);end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus consumo PM
  #--------------------------------------------------------------------------
  def mp_consume_bonus; [1.0 + features_sum(:mp_rate), 0].max; end
  #--------------------------------------------------------------------------
  # * Restituisce il rateo del danno
  #--------------------------------------------------------------------------
  def damage_rate; 1.0 + features_sum(:damage_rate); end
  #--------------------------------------------------------------------------
  # * Restituisce il rateo del danno magico
  #--------------------------------------------------------------------------
  def magic_damage_rate; 1.0 + features_sum(:magic_dmg); end
  #--------------------------------------------------------------------------
  # * Restituisce la difesa magica
  #--------------------------------------------------------------------------
  def magic_def; 1.0 + features_sum(:magic_def); end
  #--------------------------------------------------------------------------
  # * Restituisce il rateo del riflesso danno fisico
  #--------------------------------------------------------------------------
  def physical_reflect; features_sum(:physical_reflect); end
  #--------------------------------------------------------------------------
  # * Bonus iniziale per infliggere status
  #--------------------------------------------------------------------------
  def state_def_bonus; features_sum(:state_def_bonus); end
  #--------------------------------------------------------------------------
  # * Bonus iniziale per infliggere status (in percentuale)
  #--------------------------------------------------------------------------
  def state_inflict_perc; features_sum(:state_inflict_perc); end
  #--------------------------------------------------------------------------
  # * Bonus iniziale per durata status (in percentuale)
  #--------------------------------------------------------------------------
  def state_durab_bonus; features_sum(:state_inflict_durability); end
  #--------------------------------------------------------------------------
  # * Modificatore della durata del buff
  #--------------------------------------------------------------------------
  def buff_modificator; features_sum(:buff_durability); end
  #--------------------------------------------------------------------------
  # * Modificatore della durata dei debuff
  #--------------------------------------------------------------------------
  def debuff_modificator; features_sum(:debuff_durability); end
  #--------------------------------------------------------------------------
  # * Modificatore della probabilità di resistere agli status (perc)
  #--------------------------------------------------------------------------
  def state_probability_perc; features_sum(:state_inflict_perc); end
  #--------------------------------------------------------------------------
  # * Modificatore della probabilità di resistere agli status
  #--------------------------------------------------------------------------
  def state_probability_adder; features_sum(:state_def_bonus); end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus mastery riferito ad un parametro
  #--------------------------------------------------------------------------
  def mastery(param); 0; end
  #--------------------------------------------------------------------------
  # * Modificatore del costo di un tipo di abilità
  #--------------------------------------------------------------------------
  def cost_type(type); features_sum(:cost_skill, "(#{type})"); end
  #--------------------------------------------------------------------------
  # * Restituisce gli stati che rimuove
  #--------------------------------------------------------------------------
  def minus_state_set; h87attr_minus_state_set + custom_minus_state_set; end
  #--------------------------------------------------------------------------
  # * Restituisce gli stati che aggiunge
  #--------------------------------------------------------------------------
  def plus_state_set; h87attr_plus_state_set + custom_plus_state_set; end
  #--------------------------------------------------------------------------
  # * Restituisce true se il battler ha ultima chance
  #--------------------------------------------------------------------------
  def has_last_chance?; has_feature?("last_chance"); end
  #--------------------------------------------------------------------------
  # * Restituisce il danno critico
  #--------------------------------------------------------------------------
  def cri_dmg; 3.0 + features_sum(:critical_damage); end
  #--------------------------------------------------------------------------
  # * Restituisce il danno critico (per mostrare con percentuale)
  #--------------------------------------------------------------------------
  def crd; (cri_dmg * 100).to_i; end
  #--------------------------------------------------------------------------
  # * Restituisce il costo delle abilità (per mostrare con percentuale)
  #--------------------------------------------------------------------------
  def csr; (mp_consume_bonus * 100).to_i; end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus percentuale per infliggere stati alterati
  #--------------------------------------------------------------------------
  def stpw; (state_inflict_perc * 100).to_i; end
  #--------------------------------------------------------------------------
  # * Nuova formula
  #--------------------------------------------------------------------------
  def run_cdf(user, obj, formula)
    @ignore_mpd = false
    run_cdf2(user, obj, formula)
  end
  #--------------------------------------------------------------------------
  # * Effetto attacco
  #--------------------------------------------------------------------------
  def attack_effect(attacker)
    @bomb = bombified?
    h87attr_att_eff(attacker)
  end
  #--------------------------------------------------------------------------
  # * Effetto skill
  #--------------------------------------------------------------------------
  def skill_effect(user, skill)
    @bomb = bombified?
    h87attr_skill_effect(user, skill)
  end
  #--------------------------------------------------------------------------
  # * Aggiungo controlli all'attacco
  #--------------------------------------------------------------------------
  def make_attack_damage_value(attacker)
    set_last_action(attacker)
    hit_states(attacker)
    damage_states
    make_attack_damage_value_ht(attacker)
    @hp_damage = (@hp_damage * CPanel::TSWRate).to_i if attacker.has2w
    change_damage_rate
    if @hp_damage > 0
      modifica_danno if actor?
      @last_damage = @hp_damage
      self.cumuled_damage += @hp_damage
      attacker.hp -= (@hp_damage * physical_reflect).to_i if physical_reflect > 0
      if attacker.charge_gauge?
        incr = attacker.anger_incr
        incr /= 2 if attacker.has2w
        attacker.anger += incr
      end
      self.anger += anger_incr if charge_gauge? && anger_on_damage?
    end
    if attacker.vampire_rate > 0
      attacker.hp += (@hp_damage*attacker.vampire_rate).to_i
    end
  end
  #--------------------------------------------------------------------------
  # * Imposta il modificatore del danno
  #--------------------------------------------------------------------------
  def change_damage_rate
    return unless @hp_damage > 0
    @hp_damage = [(@hp_damage * damage_rate).to_i, 0].max
  end
  #--------------------------------------------------------------------------
  # * Restituisce il moltiplicatore del costo dell'abilità a seconda del tipo
  #--------------------------------------------------------------------------
  def cost_types(skill)
    sum = 0.0
    skill.sk_types.each{|type| sum += cost_type(type)}
    sum
  end
  #--------------------------------------------------------------------------
  # * Triplo consumo se taumaturgica
  #--------------------------------------------------------------------------
  def calc_mp_cost(skill)
    return 0 if charge_gauge?
    if skill.can_tau? && !$game_temp.in_battle && taumaturgic?
      mp_cost = tau_mp_cost(skill) * 3
    else
      mp_cost = tau_mp_cost(skill)
    end
    mp_cost = (mp_cost.to_f * (mp_consume_bonus + cost_types(skill))).to_i
  end
  #--------------------------------------------------------------------------
  # * Restituisce gli stati d'attacco rimossi dagli status
  #--------------------------------------------------------------------------
  def custom_minus_state_set
    states = []
    for state in self.states
      next if state.nil?
      states |= state.attack_minus_states
    end
    states
  end
  #--------------------------------------------------------------------------
  # * Restituisce gli stati d'attacco aggiunti dagli status
  #--------------------------------------------------------------------------
  def custom_plus_state_set
    states = []
    for state in self.states
      next if state.nil?
      states |= state.attack_plus_states
    end
    states
  end
  #--------------------------------------------------------------------------
  # * Aggiunta effetto cura Ira
  #--------------------------------------------------------------------------
  def item_effect(user, item)
    h87attr_item_effect(user, item)
    unless @skipped
      if charge_gauge? and item.anger_rate > 0
        self.anger += item.anger_rate
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Item test per oggetti che caricano l'ira
  #--------------------------------------------------------------------------
  def item_test(user, item)
    if charge_gauge?
      return false if dead?
      return true if item.anger_rate > 0 and self.anger < max_anger
      return false if item.parameter_type == 2
    end
    h87attr_item_test(user,item)
  end
  #--------------------------------------------------------------------------
  # * Aggiunta di controlli a una skill
  # @param [Game_Battler] user
  # @param [RPG::UsableItem] obj
  #--------------------------------------------------------------------------
  def make_obj_damage_value(user,obj)
    @skill_state_inflict = obj
    @user_state_inflict = user
    set_last_action(user, obj)
    hit_states(user, obj)
    damage_states(obj)
    recharge_all if obj.skill_recharge?
    make_obj_damage_value_ht(user, obj)
    if user.vampire_rate > 0 && (@hp_damage > 0 || @mp_damage > 0) && !obj.absorb_damage
      user.hp += (@hp_damage*user.vampire_rate).to_i
      user.mp += (@mp_damage*user.vampire_rate).to_i
      user.animation_id = 439 unless user.animation_id > 0
    end
    @hp_damage = apply_magical_rate(user, @hp_damage, obj)
    change_damage_rate
    @mp_damage = apply_magical_rate(user, @mp_damage, obj)
    $game_party.tank.gain_aggro(obj.tank_odd) if obj.tank_odd > 0
    if obj.absorb_damage_party && obj.spi_f > 0
      check_party_absorb_heal(user, obj)
    end
    if @hp_damage > 0
      modifica_danno if actor?
      @last_damage = @hp_damage
      self.anger += anger_incr if charge_gauge? && anger_on_damage?
      self.cumuled_damage += @hp_damage
      if physical_reflect > 0 && obj.atk_f > 0 && !obj.absorb_damage
        user.hp -= (@hp_damage * physical_reflect).to_i
        user.mp -= (@mp_damage * physical_reflect).to_i
        user.animation_id = 440 unless user.animation_id > 0
      end
    end
    @skill_state_inflict = nil
    @user_state_inflict = nil
  end
  #--------------------------------------------------------------------------
  # * Restituisce la cura di gruppo di un assorbimento vampirico
  #--------------------------------------------------------------------------
  def check_party_absorb_heal(user, obj)
    if user.actor?
      party = $game_party
      sprites = $scene.spriteset.actor_sprites
    else
      party = $game_troop
      sprites = $scene.spriteset.enemy_sprites
    end
    members = party.members.select{|member| !member.dead?}
    return if members.size == 0
    heal = [self.hp, @hp_damage].min/members.size
    for member in members
      member.hp += heal
      sprites[member.index].damage_pop(heal)
      member.animation_id = 441
    end
  end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus gruppo al parametro
  # @param [Integer] value
  # @param [String] param
  # @return [Integer]
  #--------------------------------------------------------------------------
  def party_bonus(value, param = nil); value; end
  #--------------------------------------------------------------------------
  # * Applica il rateo del danno magico
  #--------------------------------------------------------------------------
  # @param [Game_Battler] user
  # @param [Integer] damage
  # @param [RPG::Skill] skill
  def apply_magical_rate(user, damage, skill)
    return damage unless damage > 0
    return damage unless skill.spi_f > 0
    (damage * (1.0+(user.magic_damage_rate - self.magic_def).to_f)).to_i
  end
  #--------------------------------------------------------------------------
  # * Resistenza del personaggio alla magia
  #--------------------------------------------------------------------------
  def res; (magic_def * 100).to_i - 100; end
  #--------------------------------------------------------------------------
  # * Moltiplicatore di danno delle magie
  #--------------------------------------------------------------------------
  def mdmg; (magic_damage_rate * 100).to_i - 100; end
  #--------------------------------------------------------------------------
  # * Imposta l'ultima azione del battler
  #--------------------------------------------------------------------------
  def set_last_action(user, obj = nil)
    if obj.nil?
      user.last_action = 0
    else
      user.last_action = obj.id
      user.last_action *= -1 if obj.is_a?(RPG::Item)
    end
  end
  #--------------------------------------------------------------------------
  # * Alias del metodo probabilità status
  #--------------------------------------------------------------------------
  def state_probability(state_id)
    value = h87_attr_state_prob(state_id)
    return value if value == 0 or value >= 100
    state = $data_states[state_id]
    apply_state_bm(value,@user_state_inflict,@skill_state_inflict,state)
  end
  #--------------------------------------------------------------------------
  # * aggiungi uno stato
  #--------------------------------------------------------------------------
  def add_state(state_id, skill = nil)
    state = $data_states[state_id]
    return if state == nil                # I dati sono invalidi?
    return if state_ignore?(state_id)     # È uno stato da ignorare?
    h87status_as(state_id)
    check_durability_bonus(state, skill)
  end
  #--------------------------------------------------------------------------
  # * Controlla il bonus durata
  #--------------------------------------------------------------------------
  def check_durability_bonus(state, skill)
    return unless state.auto_release_prob > 0 and state.hold_turn >= 0
    if $game_temp.in_battle
      user = $scene.active_battler
    else
      user = $scene.actor
    end
    turns = (state_duration(user, skill, state) + @state_turns[state.id]).to_i
    @state_turns[state.id] = turns
  end
  #--------------------------------------------------------------------------
  # * Controlla il bonus durata (in turni)
  #--------------------------------------------------------------------------
  def state_duration(user, skill, state)
    modificator = 0
    modificator += user.state_durab_bonus if user != nil
    modificator += buff_modificator if state.buff?
    modificator += debuff_modificator if state.debuff?
    modificator += skill.state_durab_bonus if skill
    modificator
  end
  #--------------------------------------------------------------------------
  # * Applicazione del bonus
  #--------------------------------------------------------------------------
  def apply_state_bm(value, user, skill, state)
    return value if skill.ignore_bonus || state.ignore_bonus
    bonus = state_prob_mult(skill, user, state)
    adder = state_prob_adder(skill, user, state)
    if skill.atk_f > 0
      bonus += (user.atk.to_f + adder) / self.def*2
    end
    if skill.spi_f > 0
      bonus += (user.spi.to_f + adder) / self.def*2 + (magic_damage_rate-1)/2
    end
    (value * bonus.to_f).to_i
  end
  #--------------------------------------------------------------------------
  # * Restituisce il moltiplicatore di probabilità di infliggere lo status
  #--------------------------------------------------------------------------
  def state_prob_mult(skill, user, state)
    bonus = skill.state_inflict_perc
    bonus += user.state_inflict_perc
    bonus += state.state_inflict_perc
    bonus += self.state_probability_perc
    bonus
  end
  #--------------------------------------------------------------------------
  # * Restituisce la probabilità aggiuntiva di infliggere lo status
  #--------------------------------------------------------------------------
  # @param [RPG::Skill] skill
  # @param [Game_Battler] user
  # @param [RPG::State] state
  def state_prob_adder(skill, user, state)
    bonus = skill.state_def_bonus
    bonus += user.state_def_bonus
    bonus += state.state_inflict_perc
    bonus += self.state_probability_adder
    bonus
  end
  #--------------------------------------------------------------------------
  # * Controlla gli stati attivabili tramite danno e aumenta la barra se è una
  #   dominazione ed è dotata di bonus.
  #--------------------------------------------------------------------------
  def damage_states(obj = nil)
    if obj.nil? || obj.base_damage > 0
      if actor?
        activate_damage_states
        increase_charge if self.rech_bonus?
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Controlla gli stati attivabili tramite attacco
  #--------------------------------------------------------------------------
  def hit_states(user, obj = nil)
    return unless user.actor?
    user.activate_hit_states if obj.nil? || obj.base_damage > 0
  end
  #--------------------------------------------------------------------------
  # * Restituisce il danno accumulato
  #--------------------------------------------------------------------------
  def cumuled_damage
    @cumuled_damage = 0 if @cumuled_damage.nil?
    @cumuled_damage
  end
  #--------------------------------------------------------------------------
  # * Restituisce l'ultima azione dell'eroe. ID della skill, 0 se attacco
  #--------------------------------------------------------------------------
  def last_action
    @last_action = 0 if @last_action == nil
    @last_action
  end
  #--------------------------------------------------------------------------
  # * Imposta l'ultima azione
  #   actionid: -1 se è un item, 0 se è un attacco, >0 se è una skill
  #--------------------------------------------------------------------------
  def last_action=(actionid)
    @last_action = actionid
  end
  #--------------------------------------------------------------------------
  # * Incrementa la durata della dominazione
  #--------------------------------------------------------------------------
  def increase_charge
    $game_temp.domination_energy += CPanel::CHARGEDOMATTACK
  end
  #--------------------------------------------------------------------------
  # * Restituisce gli status virali (NON USATO, DEPRECATO)
  #--------------------------------------------------------------------------
  def viral_states
    viral = []
    for state in self.states
      next if state.nil?
      viral.push(state) if state.viral
    end
    viral
  end
  #--------------------------------------------------------------------------
  # * Restituisce lo status virale
  #--------------------------------------------------------------------------
  def infected
    for state in self.states
      next if state.nil?
      return state.id if state.viral
    end
    0
  end
  #--------------------------------------------------------------------------
  # * Attiva lo stato di protezione ultima chance
  #--------------------------------------------------------------------------
  def check_last_chance
    @last_chance_on = has_last_chance?
  end
  #--------------------------------------------------------------------------
  # * Restituisce true se l'eroe ha ultima chance attiva
  #--------------------------------------------------------------------------
  def last_chance?; @last_chance_on; end
  #--------------------------------------------------------------------------
  # * Alias del metodo hp= per controllo ultima chance
  #--------------------------------------------------------------------------
  def hp=(hp)
    alive = true if self.hp > 0
    h87attr_hp(hp)
    if self.hp == 0 && alive && last_chance?
      h87attr_hp(1)
      @last_chance_on = false
    end
  end
  #--------------------------------------------------------------------------
  # * Ricarica tutte le abilità
  #--------------------------------------------------------------------------
  def recharge_all
    flush_turn_skills
  end
end #game_battler

#==============================================================================
# ** Game_Actor
#---------------------------------------------------------------------------
#  Metodi specifici per l'eroe
#==============================================================================
class Game_Actor < Game_Battler
  unless $@
    alias ex_attr_skills skills
    alias ex_attr_mp mp
    alias ex_attr_maxmp maxmp
    alias tau_skill_can_use? skill_can_use?
    alias ex_attr_equippable? equippable?
    alias ex_attr_atk atk
    alias ex_attr_def def
    alias ex_attr_spi spi
    alias ex_attr_agi agi
    alias ex_attr_eva eva
    alias ex_attr_hit hit
    alias ex_attr_cri cri
  end
  #--------------------------------------------------------------------------
  # * Inizializza i valori prima di una battaglia
  #--------------------------------------------------------------------------
  def init_for_battle
    super
    self.song_count = 0
    initialize_anger
  end
  #--------------------------------------------------------------------------
  # * restituisce il set di abilità impostate
  #--------------------------------------------------------------------------
  def skill_sets
    sk = []
    for equip in equips
      next if equip.nil?
      sk ||= equip.skill_set
    end
    for state in states
      next if state.nil?
      sk ||= state.skill_set
    end
    sk
  end
  #--------------------------------------------------------------------------
  # * Alias delle skill
  #--------------------------------------------------------------------------
  def skills
    return ex_attr_skills if skill_sets.empty?
    setted_skills
  end
  #--------------------------------------------------------------------------
  # * Restituisce le abilità settate
  #--------------------------------------------------------------------------
  def setted_skills
    result = []
    for i in skill_sets
      result.push($data_skills[i])
    end
    result
  end
  #--------------------------------------------------------------------------
  # * restituisce le feature
  # @return [Array<RPG::BaseItem>]
  #--------------------------------------------------------------------------
  def features; equips.compact + super; end
  #--------------------------------------------------------------------------
  # * restituisce il rateo vampiro
  #--------------------------------------------------------------------------
  def vampire_rate; features_sum(:vampire_rate)/100.0; end
  #--------------------------------------------------------------------------
  # * Restituisce se l'eroe usa la barra charge
  #--------------------------------------------------------------------------
  def charge_gauge?;super||H87AttrSettings::Charge_Actors.include?(self.id);end
  #--------------------------------------------------------------------------
  # * restituisce true se l'eroe ha 2 armi
  #--------------------------------------------------------------------------
  def has2w
    armi = 0
    for equipment in equips
      armi +=1 if equipment.is_a?(RPG::Weapon)
    end
    return armi >= 2
  end
  #--------------------------------------------------------------------------
  # * Restituisce il nuovo valore secondo il bonus del gruppo
  #   value: valore iniziale
  #   param: parametro (atk, def, spi, agi, eva, hit, cri)
  #--------------------------------------------------------------------------
  def party_bonus(value, param)
    value += super
    return value unless $game_temp.in_battle
    if [:hit, :eva, :agi].include?(param)
      value + $game_party.party_bonus(param)
    else
      (value * (1.0 + $game_party.party_bonus(param))).to_i
    end
  end
  #--------------------------------------------------------------------------
  # * restituisce il bonus dello spirito all'attacco
  #--------------------------------------------------------------------------
  def spirit_attack
    attack_bonus = calc_spirit_attack
    attack_bonus > 0 ? (attack_bonus * spi).to_i : 0
  end
  #--------------------------------------------------------------------------
  # * restituisce il calcolatore di percentuale dello spirito
  #--------------------------------------------------------------------------
  def calc_spirit_attack; features_sum(:spirit_attack); end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus regalo del gruppo
  #   param: parametro
  #--------------------------------------------------------------------------
  def party_gift(param)
    return 0 if param_gift(param) > 0
    $game_party.param_gift(param)
  end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus che dà il personaggio al gruppo
  #   param: parametro
  #--------------------------------------------------------------------------
  def actor_party_bonus(param)
    bonus = 0
    for state in self.states
      if state.party_bonus[param] != nil
        bonus += state.party_bonus[param]
      end
    end
    bonus
  end
  #--------------------------------------------------------------------------
  # * modifica del valore d'attacco
  #--------------------------------------------------------------------------
  def atk;party_bonus(ex_attr_atk, :atk) + party_gift(:atk) + spirit_attack;end
  #--------------------------------------------------------------------------
  # * modifica del valore di difesa
  #--------------------------------------------------------------------------
  def def;party_bonus(ex_attr_def, :def) + party_gift(:def);end
  #--------------------------------------------------------------------------
  # * modifica del valore spirito
  #--------------------------------------------------------------------------
  def spi;party_bonus(ex_attr_spi, :spi) + party_gift(:spi);end
  #--------------------------------------------------------------------------
  # * modifica del valore agilità
  #--------------------------------------------------------------------------
  def agi;party_bonus(ex_attr_agi, :agi) + party_gift(:agi)+rhytm_bonus;end
  #--------------------------------------------------------------------------
  # * modifica del valore d'evasione
  #--------------------------------------------------------------------------
  def eva;party_bonus(ex_attr_eva, :eva);end
  #--------------------------------------------------------------------------
  # * modifica del valore di mira
  #--------------------------------------------------------------------------
  def hit
    malus_hit = has2w ? CPanel::TWHIT : 0
    party_bonus(ex_attr_hit, :hit) - malus_hit
  end
  #--------------------------------------------------------------------------
  # * Restituisce il conto dei canti consecutivi
  #--------------------------------------------------------------------------
  def song_count
    @song_count = 0 if @song_count.nil?
    @song_count
  end
  #--------------------------------------------------------------------------
  # * Modifica il conto dei canti
  #--------------------------------------------------------------------------
  def song_count=(value)
    @song_count = 0 if @song_count.nil?
    @song_count = value
  end
  #--------------------------------------------------------------------------
  # * Restituisce true se ha il bonus pozioni
  #--------------------------------------------------------------------------
  def item_bonus; features_sum(:item_bonus);end
  #--------------------------------------------------------------------------
  # * Restituisce true se l'eroe possiede taumaturgia
  #--------------------------------------------------------------------------
  def taumaturgic?; has_feature?(:taumaturgic); end
  #--------------------------------------------------------------------------
  # * Restituisce la rabbia accumulata
  #--------------------------------------------------------------------------
  def anger; @anger = 0 if @anger.nil?; @anger; end
  #--------------------------------------------------------------------------
  # * Imposta l'ira
  #--------------------------------------------------------------------------
  def anger=(value); @anger = [[0,value].max, max_anger].min; end
  #--------------------------------------------------------------------------
  # * Restituisce il rate dell'ira
  #--------------------------------------------------------------------------
  def anger_rate; anger.to_f/max_anger; end
  #--------------------------------------------------------------------------
  # * Restituisce l'ira massima
  #--------------------------------------------------------------------------
  def max_anger; H87AttrSettings::Default_Charge_Max + max_anger_bonus; end
  #--------------------------------------------------------------------------
  # * Restituisce il valore d'incremento dell'ira
  #--------------------------------------------------------------------------
  def anger_incr; H87AttrSettings::Anger_Incr + anger_bonus; end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus dell'ira massima
  #--------------------------------------------------------------------------
  def max_anger_bonus;features_sum(:max_anger_bonus);end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus d'ira
  #--------------------------------------------------------------------------
  def anger_bonus;features_sum(:anger_bonus);end
  #--------------------------------------------------------------------------
  # * Ira iniziale
  #--------------------------------------------------------------------------
  def initial_anger; rand(5) + initial_anger_bonus; end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus di ira iniziale
  #--------------------------------------------------------------------------
  def initial_anger_bonus;features_sum(:anger_init);end
  #--------------------------------------------------------------------------
  # * Inizializza la barra Ira
  #--------------------------------------------------------------------------
  def initialize_anger;self.anger += initial_anger if charge_gauge?;end
  #--------------------------------------------------------------------------
  # * Restituisce true se ha un'abilità o un equip che gli ricarica l'ira
  #--------------------------------------------------------------------------
  def anger_on_damage?; has_feature?(:anger_damage);end
  #--------------------------------------------------------------------------
  # * Restituisce l'ammontare di ira ricevuta per uccidere un nemico
  #--------------------------------------------------------------------------
  def anger_kill; features_sum(:anger_kill); end
  #--------------------------------------------------------------------------
  # * Restituisce la furia che si accumula ad ogni turno
  #--------------------------------------------------------------------------
  def anger_turn; features_sum(:anger_turn); end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus del salvataggio oggetto
  #--------------------------------------------------------------------------
  def save_item_bonus; features_sum(:item_save); end
  #--------------------------------------------------------------------------
  # * Restituisce true se l'eroe è in status difensore (assorbe danni)
  #--------------------------------------------------------------------------
  def defender?; has_feature?(:defender); end
  #--------------------------------------------------------------------------
  # * Restituisce true se l'eroe è un tipo virile
  #--------------------------------------------------------------------------
  def virile?; has_feature?(:viril); end
  #--------------------------------------------------------------------------
  # * Restituisce true se l'eroe può scassinare porte
  #--------------------------------------------------------------------------
  def scassinatore?; has_feature?(:scassinate); end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus durata delle dominazioni dell'eroe
  #--------------------------------------------------------------------------
  def dom_bonus; features_sum(:dom_bonus); end
  #--------------------------------------------------------------------------
  # * Restituisce lo charm del personaggio
  #--------------------------------------------------------------------------
  def charm; features_sum(:charm); end
  #--------------------------------------------------------------------------
  # * Restituisce true se la dominazione ha lo status di ricarica
  #--------------------------------------------------------------------------
  def rech_bonus?; has_feature?(:esper_recharger); end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus di ricarica (0.5: 50% di bonus, battaglie dimezz.)
  #--------------------------------------------------------------------------
  def fast_ready_bonus; [100, features_sum(:fast_ready)].min/100.0; end
  #--------------------------------------------------------------------------
  # * Restituisce true se la dominazione ha il bonus di salvataggio
  #--------------------------------------------------------------------------
  def save_domination?; has_feature?(:save_domination); end
  #--------------------------------------------------------------------------
  # * Restituisce true se il personaggio ha l'abilità per saltare lontano
  #--------------------------------------------------------------------------
  def can_jump_longer?; has_feature?(:long_jump); end
  #--------------------------------------------------------------------------
  # * Restituisce true se il personaggio ha l'abilità ritmo
  #--------------------------------------------------------------------------
  def has_rhytm?; has_feature?(:rhytm); end
  #--------------------------------------------------------------------------
  # * Restituisce il divisore di passi
  #--------------------------------------------------------------------------
  def step_divisor; 10 + features_sum(:anger_mantain); end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus probabilità alla sintesi
  #--------------------------------------------------------------------------
  def synth_probability_bonus; features_sum(:synth_bonus);  end
  #--------------------------------------------------------------------------
  # * Restituisce gli HP guariti a fine battaglia
  #--------------------------------------------------------------------------
  def win_hp; maxhp * features_sum(:hp_on_win); end
  #--------------------------------------------------------------------------
  # * Restituisce gli MP guariti a fine battaglia
  #--------------------------------------------------------------------------
  def win_mp; maxmp * features_sum(:mp_on_win); end
  #--------------------------------------------------------------------------
  # * Restituisce i passi compiuti dall'eroe
  #--------------------------------------------------------------------------
  def steps; @steps = 0 if @steps.nil?; @steps; end
  #--------------------------------------------------------------------------
  # * Modifica il valore dei passi dell'eroe
  #--------------------------------------------------------------------------
  def steps=(new_value); @steps = new_value; end
  #--------------------------------------------------------------------------
  # * Riduce l'ira con i passi
  #--------------------------------------------------------------------------
  def reduce_anger
    self.steps += 1
    self.anger -= 1 if steps%step_divisor == 0
  end
  #--------------------------------------------------------------------------
  # * Alias di skill_can_use?
  #--------------------------------------------------------------------------
  def skill_can_use?(skill)
    return false if skill.can_tau? && !taumaturgic? && !$game_temp.in_battle
    return false if charge_gauge? && calc_anger_cost(skill) > self.anger
    tau_skill_can_use?(skill)
  end
  #--------------------------------------------------------------------------
  # * Restituisce il costo ira dell'abilità
  #--------------------------------------------------------------------------
  def calc_anger_cost(skill)
    return 0 unless charge_gauge?
    cost = skill.anger_cost
    cost /= 2 if half_mp_cost
    (cost * self.mp_consume_bonus).to_i
  end
  #--------------------------------------------------------------------------
  # * Modifica il danno se c'è un difensore
  #--------------------------------------------------------------------------
  def modifica_danno
    riduci_danno_difensore
    riduci_danno_evocazione
  end
  #--------------------------------------------------------------------------
  # * Modifica il danno se c'è un difensore
  #--------------------------------------------------------------------------
  def riduci_danno_difensore
    party_def = $game_party.defender
    if party_def != nil and !self.defender? and @hp_damage > 0
      old_dmg = @hp_damage
      @hp_damage *= CPanel::PROTECTRATE
      $game_party.defender.hp -= old_dmg - @hp_damage
    end
  end
  #--------------------------------------------------------------------------
  # * Modifica il danno se c'è un difensore
  #--------------------------------------------------------------------------
  def riduci_danno_evocazione
    return unless $game_temp.esper_active
    for member in $game_party.members
      domination = member if member.domination?
    end
    return if domination.nil?
    old_dmg = @hp_damage
    @hp_damage -= (@hp_damage * H87AttrSettings::VLINK_RATE).to_i
    domination.hp -= (old_dmg * H87AttrSettings::VLINK_RATE).to_i
  end
  #--------------------------------------------------------------------------
  # * Determina se l'oggetto può essere equipaggiato
  # @param [RPG::BaseItem] item
  # @return [Boolean]
  #--------------------------------------------------------------------------
  def equippable?(item)
    if item.is_a?(RPG::Armor)
      return false if two_swords_style and item.kind == 0
    end
    if item.is_a?(RPG::Weapon) or item.is_a?(RPG::Armor)
      return false if item.equip_level > self.level
      return true if permit_equips(item)
    end
    ex_attr_equippable?(item)
  end
  #--------------------------------------------------------------------------
  # * Restituisce l'array dei potenziamenti
  # @param [RPG::BaseItem] item
  # @return [Boolean]
  #--------------------------------------------------------------------------
  def permit_equips(item)
    permit_plus = feature_array(:allow_equip_type).uniq
    item.tipi.each do |tipo|
      return true if permit_plus.include?(tipo)
    end
    false
  end
  #--------------------------------------------------------------------------
  # * Controlla e attiva gli status che si attivano con l'attacco
  #--------------------------------------------------------------------------
  def activate_hit_states
    hit_states = get_hit_states_array
    hit_states.each do |hit|
      add_state(hit[0]) if hit[1] > rand
    end
  end
  #--------------------------------------------------------------------------
  # * Controlla e attiva gli status che si attivano con il danno
  #--------------------------------------------------------------------------
  def activate_damage_states
    damage_states = get_damage_states_array
    damage_states.each do |damage|
      add_state(damage[0]) if damage[1] > rand
    end
  end
  #--------------------------------------------------------------------------
  # * Ottiene l'array degli status attivabili con l'attacco
  #--------------------------------------------------------------------------
  def get_hit_states_array
    array = []
    for state in self.states
      array.push([state.status_hit, state.status_hit_prob]) if state.status_hit > 0
      array.push([state.id, 100]) if state.viral
    end
    for equip in equips
      next if equip.nil?
      array.push([equip.status_hit, equip.status_hit_prob]) if equip.status_hit > 0
    end
    return array
  end
  #--------------------------------------------------------------------------
  # * Ottiene l'array degli status attivabili con il danno
  #--------------------------------------------------------------------------
  def get_damage_states_array
    array = []
    for state in self.states
      array.push([state.status_dmg, state.status_dmg_prob]) if state.status_dmg > 0
      array.push([state.id, 100]) if state.viral
    end
    for equip in equips
      next if equip.nil?
      array.push([equip.status_dmg, equip.status_dmg_prob]) if equip.status_dmg > 0
    end
      array
  end
  #--------------------------------------------------------------------------
  # * Restituisce il valore aggiunto della propria difesa al gruppo
  #--------------------------------------------------------------------------
  def param_gift(param)
    multiplier = 0.0
    for state in states
      next if state.nil?
      multiplier += state.param_gift[param]
    end
    case param
      when :atk
        value = self.ex_attr_atk
      when :def
        value = self.ex_attr_def
      when :spi
        value = self.ex_attr_spi
      when :agi
        value = self.ex_attr_agi
      else
        value = 0
    end
    (value * multiplier).to_i
  end
  #--------------------------------------------------------------------------
  # * Modifica l'agilità con il ritmo
  #--------------------------------------------------------------------------
  def rhytm_bonus; song_count >= 2 ? (ex_attr_agi * 0.5).to_i : 0; end
  #--------------------------------------------------------------------------
  # * Restituisce gli stati che rimuove
  #--------------------------------------------------------------------------
  def custom_minus_state_set
    result = super
    # @param [RPG::Weapon] weapon
    weapons.compact.each { |weapon|
      result |= weapon == nil ? [] : weapon.minus_state_set
    }
    result
  end
  #--------------------------------------------------------------------------
  # * Restituisce gli MP
  #--------------------------------------------------------------------------
  def mp; charge_gauge? ? 0 : ex_attr_mp; end
  #--------------------------------------------------------------------------
  # * Restituisce gli MP massimi
  #--------------------------------------------------------------------------
  def maxmp; charge_gauge? ? 0 : ex_attr_maxmp; end
end #game_actor

#==============================================================================
# ** Game_Enemy
#---------------------------------------------------------------------------
#  Metodo per il contagio delle unità
#==============================================================================
class Game_Enemy < Game_Battler
  alias h87attr_perform_collapse perform_collapse unless $@
  #--------------------------------------------------------------------------
  # * Restituisce le features
  #--------------------------------------------------------------------------
  def features; super + [enemy]; end
  #--------------------------------------------------------------------------
  # * Morte
  #--------------------------------------------------------------------------
  def perform_collapse
    if $game_temp.in_battle and dead? and @bomb
      @bomb = false
      @hp = 1
      bombific_explode
    else
      h87attr_perform_collapse
    end
  end
  #--------------------------------------------------------------------------
  # * Restituisce true se il battler è affetto da bombificazione
  #--------------------------------------------------------------------------
  def bombified?
    self.states.each{|state|return true if state.bombifica}
    return false
  end
  #--------------------------------------------------------------------------
  # * Esplode.
  #--------------------------------------------------------------------------
  def bombific_explode; $scene.bomb_explode(self); end
end
#==============================================================================
# ** Game_Unit
#---------------------------------------------------------------------------
#  Metodo per il contagio delle unità
#==============================================================================
class Game_Unit
  #--------------------------------------------------------------------------
  # * Controlla e diffonde il contagio tra i membri
  #--------------------------------------------------------------------------
  def check_plague
    for member in members
      inf = member.infected
      if inf > 0
        expand_plague(inf)
        break
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Espande il contagio
  #   inf: id dello stato virale
  #--------------------------------------------------------------------------
  def expand_plague(inf)
    sane = []
    for member in members
      sane.push(member) if member.infected == 0
    end
    if sane.size > 0
      battler = sane[rand(sane.size)]
      battler.apply_state_changes(FakeStObj.new(inf))
    end
  end
end

#==============================================================================
# ** FakeStObj
#---------------------------------------------------------------------------
#  Classe che serve come rimpiazzo delle skill per applicare gli status.
#==============================================================================
class FakeStObj
  attr_reader :plus_state_set
  attr_reader :minus_state_set
  def initialize(state_id)
    @plus_state_set = [state_id]
    @minus_state_set = []
  end
end

#==============================================================================
# ** Game_Party
#---------------------------------------------------------------------------
#  Metodi d'informazione per il gruppo
#==============================================================================
class Game_Party < Game_Unit
  #--------------------------------------------------------------------------
  # * Restituisce il difensore del gruppo o nil (colui che prende danno al
  #   posto degli alleati)
  #--------------------------------------------------------------------------
  def defender
    for member in battle_members
      return member if member.defender?
      return member if member.defender?
    end
    nil
  end
  #--------------------------------------------------------------------------
  # * Restituisce il tank del gruppo
  #--------------------------------------------------------------------------
  def tank
    for i in 0..H87AttrSettings::TANKS.size-1
      return $game_actors[i] if battle_members.include?($game_actors[i])
    end
    nil
  end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus parametro del gruppo
  #   param: parametro (atk, def, spi, agi, cri, hit, eva)
  #--------------------------------------------------------------------------
  def party_bonus(param)
    bonus = 0
    for member in members
      bonus += member.actor_party_bonus(param)
    end
    bonus
  end
  #--------------------------------------------------------------------------
  # * Restituisce il parametro aggiunto da un membro del gruppo
  #   param: parametro (atk, def, spi, agi)
  #--------------------------------------------------------------------------
  def param_gift(param)
    bonus = 0
    return bonus unless $game_temp.in_battle
    for member in members
      bonus += member.param_gift(param)
    end
    bonus
  end
  #--------------------------------------------------------------------------
  # * Non fa consumare l'oggetto con la giusta probabilità
  #--------------------------------------------------------------------------
  alias save_consume_item consume_item unless $@
  def consume_item(item)
    save_consume_item(item) unless save_prob >= rand && !$game_temp.in_battle
  end
  #--------------------------------------------------------------------------
  # * Alias del metodo per incrementare passi per scalare l'ira
  #--------------------------------------------------------------------------
  alias h87attr_increase_steps increase_steps unless $@
  def increase_steps
    h87attr_increase_steps
    for member in members
      member.reduce_anger if member.charge_gauge?
    end
  end
  #--------------------------------------------------------------------------
  # * Restituisce la probabilità di salvare l'oggetto
  #--------------------------------------------------------------------------
  def save_prob
    return 0 unless $game_temp.in_battle
    $game_temp.active_battler.save_item_bonus
  end
  #--------------------------------------------------------------------------
  # * Restituisce true se un membro del gruppo ha scassinatore
  #--------------------------------------------------------------------------
  def ha_scassinatore?
    for member in members
      return true if member.scassinatore?
    end
    false
  end
  #--------------------------------------------------------------------------
  # * Restituisce true se un membro del gruppo ha virilità
  #--------------------------------------------------------------------------
  def ha_virile?
    for member in members
      return true if member.virile?
    end
    false
  end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus di durata delle dominazioni
  #--------------------------------------------------------------------------
  def domination_bonus
    bonus = 1.0
    for member in members
      bonus += member.dom_bonus
    end
    bonus
  end
  #--------------------------------------------------------------------------
  # * Restituisce il bonus sinergia del gruppo
  #--------------------------------------------------------------------------
  def bonus_sinergia
    bonus = 1.0
    for member in members
      bonus += member.sin_bonus
    end
    return bonus
  end
  #--------------------------------------------------------------------------
  # * Restituisce lo charm totale dei membri del gruppo
  #--------------------------------------------------------------------------
  def charm_totale
    charm = 0
    for member in members
      charm += member.charm
    end
    return charm
  end
  #--------------------------------------------------------------------------
  # * Restituisce true se almeno un giocatore può saltare lontano
  #--------------------------------------------------------------------------
  def has_long_jump?
    for member in members
      return true if member.can_jump_longer?
    end
    return false
  end
end #game_party

class Game_Temp
  attr_accessor :active_battler
end

#==============================================================================
# ** Scene_Battle
#---------------------------------------------------------------------------
#  Cambiamento dei metodi in Scene_Battle
#==============================================================================
class Scene_Battle < Scene_Base
  unless $@
    alias start_attr start
    alias execute_action_item_sav execute_action_item
    alias terminate_attr terminate
    alias h87attr_eas execute_action_skill
    alias consuma_oggetto_attr consuma_oggetto
    alias h87attr_process_victory process_victory
    alias execute_action_attr execute_action
    alias h87_attragg_turn_end turn_end
  end
  #--------------------------------------------------------------------------
  # * Inizio
  #--------------------------------------------------------------------------
  def start
    start_attr
    for member in $game_party.members
      member.init_for_battle
    end
    for enemy in $game_troop.members
      enemy.init_for_battle
    end
  end
  #--------------------------------------------------------------------------
  # * Alias esecuzione azione oggetto
  #--------------------------------------------------------------------------
  def execute_action_item
    $game_temp.active_battler = @active_battler if @active_battler.actor?
    execute_action_item_sav
  end
  #--------------------------------------------------------------------------
  # * Alias consuma oggetto per la skill
  #--------------------------------------------------------------------------
  def consuma_oggetto(id_oggetto, numero)
    return if @active_battler.save_item_bonus >= rand
    consuma_oggetto_attr(id_oggetto, numero)
  end
  #--------------------------------------------------------------------------
  # * Alias esecuzione dell'azione
  #--------------------------------------------------------------------------
  def execute_action
    execute_action_attr
    ab = @active_battler
    update_actor_song(ab.action.kind==1) if !ab.nil? && ab.actor?
  end
  #--------------------------------------------------------------------------
  # * Aggiorna il conteggio delle canzoni
  #--------------------------------------------------------------------------
  def update_actor_song(skill_type)
    return unless @active_battler.has_rhytm?
    if !skill_type || @active_battler.action.skill.skill_type == "Canto"
      @active_battler.song_count = 0
    else
      @active_battler.song_count += 1
    end
  end
  #--------------------------------------------------------------------------
  # * Alias di fine scena
  #--------------------------------------------------------------------------
  def terminate
    terminate_attr
    for member in $game_party.members
      member.song_count = 0
    end
  end
  #--------------------------------------------------------------------------
  # * Svuota la barra Ira quando si usa una skill
  #--------------------------------------------------------------------------
  def execute_action_skill
    h87attr_eas
    ab = @active_battler
    return if ab.nil?
    skill = ab.action.skill
    return if skill == nil
    ab.anger -= ab.calc_anger_cost(skill) if ab.charge_gauge?
  end
  #--------------------------------------------------------------------------
  # * Esplosione di un nemico colpito da Bombifica
  #--------------------------------------------------------------------------
  def bomb_explode(battler)
    for member in $game_troop.members
      member.skill_effect(battler, $data_skills[CPanel::BOMB_SKILL])
      if member == battler
        member.animation_id = 79
      else
        damage = member.hp_damage
        member.animation_id = 82
        @spriteset.enemy_sprites[member.index].damage_pop(damage)
        @spriteset.enemy_sprites[member.index].start_action(member.damage_hit)
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Alias di fine turno
  #--------------------------------------------------------------------------
  def turn_end(param = nil)
    h87_attragg_turn_end(param)
    infect_plague
    charge_anger
  end

  def process_victory
    h87attr_process_victory
    for member in $game_party.battle_members
      next if member.dead?
      member.hp += member.win_hp
      member.mp += member.win_mp
    end
  end
  #--------------------------------------------------------------------------
  # * Epidemia alla fine del turno
  #--------------------------------------------------------------------------
  def infect_plague
    $game_troop.check_plague
    $game_party.check_plague
  end

  def charge_anger
    for member in $game_party.battle_members
      next if member.nil?
      next if member.dead?
      next unless member.charge_gauge?
      member.anger += member.anger_turn
    end
  end
end

class Window_Skill < Window_Selectable
  alias h87attr_draw_item draw_item unless $@
  #--------------------------------------------------------------------------
  # alias del metodo draw_item
  #--------------------------------------------------------------------------
  def draw_item(index)
    posizione = h87attr_draw_item(index)
    rect = item_rect(index)
    rect.width -= posizione
    skill = @data[index]
    if skill != nil
      enabled = @actor.skill_can_use?(skill) # attivo se può usare la skill
      if @actor.calc_anger_cost(skill) > 0
        self.contents.font.color = anger_color
        self.contents.font.color.alpha = enabled ? 255 : 128
        costo = @actor.calc_anger_cost(skill)
        costo = costo.to_s+Vocab.anger
        self.contents.draw_text(rect, costo, 2)
        posizione += contents.text_size(costo).width+1
      end
    end
  end
end

module Vocab
  #--------------------------------------------------------------------------
  # * Vocabolo Furia
  #--------------------------------------------------------------------------
  def self.anger;"FU";end
  #--------------------------------------------------------------------------
  # * Vocabolo Furia (abbreviato)
  #--------------------------------------------------------------------------
  def self.fu_a;anger;end
end

class Window_Base < Window
  #--------------------------------------------------------------------------
  # * Colore della Furia
  #--------------------------------------------------------------------------
  def anger_color;text_color(3);end
  #--------------------------------------------------------------------------
  # * Alias del metodo draw_actor_mp. Disegna Furia se il personaggio ne è
  #   dotato.
  #--------------------------------------------------------------------------
  alias h87attr_draw_actor_mp draw_actor_mp
  def draw_actor_mp(actor, x, y, width = 120)
    if actor.charge_gauge?
      draw_actor_anger(actor, x, y, width)
    else
      h87attr_draw_actor_mp(actor, x, y, width)
    end
  end
  #--------------------------------------------------------------------------
  # * Disegna la furia dell'eroe
  #--------------------------------------------------------------------------
  def draw_actor_anger(actor, x, y, width = 120)
    draw_actor_anger_gauge(actor, x, y, width)
    contents.font.color = system_color
    contents.draw_text(x+2, y, 30, WLH, Vocab::fu_a)
    contents.font.color = normal_color
    last_font_size = contents.font.size
    text = sprintf("%2d/%2d", actor.anger, actor.max_anger)
    if width-33 < contents.text_size(text).width
      contents.draw_text(x+32, y, width-33, WLH, actor.anger.group, 1)
    else
      contents.draw_text(x+32, y, width-33, WLH, text, 1)
    end
  end

  def draw_actor_anger_gauge(actor, x, y, width = 120, height = nil)
    actor.anger = [actor.anger, actor.max_anger].min
    gc0 = gauge_back_color
    gc1 = anger_gauge_color1
    gc2 = anger_gauge_color2
    gh = Y6::SETTING::GAUGE_HEIGHT
    gh += 2 if Y6::SETTING::OUTLINE
    gy = y + WLH - 8 - (gh - 6)
    contents.fill_rect(x, gy, width, gh, gc0)
    gy += 1 if Y6::SETTING::OUTLINE
    gh -= 2 if Y6::SETTING::OUTLINE
    width -= 2 if Y6::SETTING::OUTLINE
    max_anger = [[actor.max_anger, 1].max, 999].min
    gbw = width * actor.anger / max_anger
    x += 1 if Y6::SETTING::OUTLINE
    contents.gradient_fill_rect(x, gy, gbw, gh, gc1, gc2)
  end

  def anger_gauge_color1; text_color(3); end
  def anger_gauge_color2; text_color(11); end
end

class Spriteset_Battle
  attr_reader :enemy_sprites
  attr_reader :actor_sprites
end
