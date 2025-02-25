/*

huge thanks to:
yuh for heavily inspiring  the macro + some functions
------------------------------------------------------------
credit to invalid for namek macro

Contributions:
base code: faxi
configs: keirahela

*/

#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\Lib\gui.ahk
#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\OCR-main\Lib\OCR.ahk
#Include %A_ScriptDir%\Lib\WebhookOptions.ahk
#Include %A_ScriptDir%\Lib\keybinds.ahk

global MacroStartTime := A_TickCount

SendMode "Event"
RobloxWindow := "ahk_exe RobloxPlayerBeta.exe"
UnitExistence := "|<>*91$66.btzzzzzzyDzXlzzzzzzyDzXlzzzzzzyDzXlzzzyzzyDbXlUS0UM3UC1XlUA0UE30A1XlW4EXl34AMXlX0sbXXC80XVX4MbXX6A1U3UA0bk30ARk7UC0bk3UA1sDUz8bw3kC1zzbyszzzzzzzzbw1zzzzzzzzby3zzzzzzzzzzjzzzzzzU"
MaxUpgrade := "|<>*134$53.0000000007U3k00000TUDk00001XUsk000033XVU0000636300800A3M6TzwS0M3UDrjRa0k70S0AS61U40s0EMAD001U0k0Ty41331k1zwA6673k7zsQAAS7UTzkwsMQC0TzVzkk0M0Tz3zVk0kETy7z3k1VkzwTz7kX7nzzzzzzzzzzzzzzzzzzw"
MaxUpgrade2 := "|<>*146$47.D07U0001z0Tk000371lU00067z3zzzzw7w7zzzzs7kDzzzzk7UTzSzzUC0w0MwD081k0UkS00301U1w82663U3sMAAC7UDkssMwD0zVvkksQ0z3zVU0k0y7z3U1UUwDy7U33VszyDX6Dbzzzzzzzzzzzzzzzy"
MaxUpgrade3 := "|<>*91$49.Dk7s00004M3600006633000031X1U0001UP0nzr3kkD0PzynAM3UD06D3A0U70331a00301U1X20VVUs1lVUklsS1kkssMwD0kMSQAC70AA/u603036413U1UUn20Vs0ksNX0My4NqMTUDnzzlwU"
VoteStart := "|<>*95$38.ryzzzzlz7zlzwDVzwTzXszz7zsSC30Q7770E40klU410C8sklVXUACAM0w7X360T1s1kEbsz0Q40zDsTVUM"
LobbyText := "|<>*134$56.0000000000k00U10000T00y1w000Cs0RkvU003606AAM000lU1X36000AMzMwlswS36zyDwTzjslw7WD4ST6AS0M1k33lX7060A0MMPlkkVX366DwQS8sFkk3z772C4QC1zlkkV327UTw40M0k1wDz1UC0Q0z3zsQ7WD4TkzzzzzzzzwTzzzzzzzy7zzzzzzzzXzzzzzzzzszs"
AreasText := "|<>*108$36.zs007zyzztzzwTzzzzwTzTzzsA4613tA421/k4M0F3k4M4FXXUQ603bmy713zzzzzzU"
MatchmakeUI := "|<>*129$83.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUzzzzzzzzzzzzz0zzzzzzzw7zzzw1zzzzzzzkDzzzs3zzzzzzzUTzzzs7zzzzzzz0zzzzkTzzzzzzy1zzzzzzzzzzzzw3zzzzzzzzzzzzs7zzzzzzzzzzzzkDy0Tw7UsDzzzzUTk0Ds7007zzzz0z00DUA007zzzy1w00D0M007zzzw3k00S0k00Dzzzs7U00Q1U00DzzzkC0S0s3060TzzzUQ1y0k60y0zzzz0s7w1UA1y1zzzy1kDs30M3w3zzzw3UTk60k7s7zy7k70TUA1UDkDzs70C0Q0s30TUTzk00S001k60z0zzU01w007UA1y1zz007w00D0M3w3zz00Dw00y0k7s7zz01zw03y1kDkDzzU7zy0Tw7UzkTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
CaptchaExistence := "|<>*100$131.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwDzzzzzzzs3zzzzzzzzzzzkDzzzzzzz01zzzzzzy7zzzUTzzzzzzs00zzzzzzs7zzz0zzzzzzzU01zzzzzzkDzzy1zzzzzzy003zzzzzzUTzzw3zzzzzzs007zzzzzz0zzzs7zzzzzzk7wTzzzzzy1zyTkDzzzzzz0Tzz0UsEDk0DU7UEDz0Uzy1zzw01U0DU0S0300Dw01zw3zzk0300C00s0600Dk03zsDzz00600C01U0A00T007zkTzw00A00A0200M00Q00DzUzzs30M3US1w1lk70s30Tz0zzkD0kDUw3s7zUT1kD0zy1zzUz1UT1s7kTz0y3Uz1zw1zz1w30y3kDUzy1w31w3zw1zC1s61s7UT0zw3s61s7zs0sA00A00D0y0Es7kA00Dzs00A00M00y0C00kDUQ00Tzs00M00k01y0A01UT0s00zzs00s01U07w0Q030y3s01zzs03s0300zw1w0C1w7s03zzw0TwCC1rzy3y1y7wDwCDzzzzzzzw3zzzzzzzzzzzzzzzzzzzzs7zzzzzzzzzzzzzzzzzzzzkDzzzzzzzzzzzzzzzzzzzzUTzzzzzzzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzzzzy3zzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Matchmaking := "|<>*93$73.zzzzzzzzzzzzzzlzzzsszzzzk08zzzwATzzzs04Tzzy6Dzzzw03zzzz3zzzzy7zzzzzVzzzzz3zX4DwElW7w8U7lU3s0Mk1w0E1sk0w0AM0Q080wM0A06A06040SAC6736737W7z6D37VX3VXl3zX7VVklXkkkVzlXkk0MlsM0EzslsQ0AMwC08zwMwC06AS7U4TyATDlb6DbxXzzzzzzzzzzzlzzzzzzzzzzs0zzzzzzzzzzw0zzzzzzzzzzy0zzzzzzzzzzzty"
AutoAbility := "|<>*83$21.zzzzzzzwD4S0kXl28wS03Xk0QSH7nWMy0n7sCQzzzzU"
ClaimText := "|<>*127$71.00000000000000A7s01y000007zTs07w00000Tzlk0AQ00003k7VU0MM0000D03300kk0000Q0667zXzsw01k0AAzzzzzy031ysTrjTSyS0C7zky0AA0EQ0QCTVs0MM00Q0ss73U0kk00M1lkC711VVUUk3VnwC73333VU73zsQS666737y3tksQAAAC7zy01Uk0MMMQDzy030k0kkksTzy061U1VVVkzzz0y3kX77XXzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
LoadingScreen := "|<>*87$90.U07zzzzzzzzzzzz000Tzzzzzzzzzzz0007zzzzzzzzzzz0001zzzzzzzzzzz0000zzzzzzzzzzz0000Tzzzzzzzzzz0000Dzzzzzzzzzz00007zzzzzzzzzz00003zzzzzzzzzz0Ds01zzzzzzzzzz0Dy01zzzzzzzzzz0DzU0y0zw1y0s1z0Dzk0w0zw0w0k0T0Dzs0w0Tw0w000D0Dzs0Q0Tw0w00070Dzw0Q0Tw0w00030Dzw0Q0Tw0w00030Dzw0Q0Tw0w00010Dzw0Q0Tw0w00010Dzw0Q0Tw0w03000Dzw0Q0Tw0w0Dk00Dzw0Q0Tw0w0Ts00Dzs0Q0Tw0w0Ts00Dzs0w0Tw0w0Tw00Dzk0w0Tw0w0Tw00DzU0w0Ts0w0Tw00Dz01w0Ds0w0Tw00Dw01y07k0w0Tw000003y0000w0Tw000007y0000w0Tw00000Dz0000w0Tw00000Dz0000w0Tw00000zzU000w0Tw00001zzk000w0Tw00003zzs040w0Tw0000Dzzw0A0y0zw0U01zzzzUy1z1zy1U"
ReplayText := "|<>*101$71.Tk0000Dk0001zs0000FU00000Q0001V000000A00032000000M00064000000Py7zA8TzwD3kw7NbMFnD8m4Vk3U3ka08P0D30703VM0ES0Q406033U0ksE08QA46711kkU0k0MQAC73U10100ksMMC7U60107UkksQB08D23j01Uk0P0kK40C070k0m10Y40A0O1U1a63AQ0sFa3kXAAyDjzky7xzwEkkA7tV01U0VVU000320000220000640000AA0000AM0000AE0000DU0000TU0000600000C1"
DeathText := "|<>*100$22.zzzzUzUw3w3l7l6ASAMtstXbXaASAQFgFkAEDUlUzzzzU"
Text := "|<>*30$71.0000007zzzzy000000Dzzzzw000000Tzzzzs000000zzzzzk000001zzzzzU000003zzzzz0000007zzzzy000000Dzzzzw000000Tzzzzs000000zzzzzk000001zzzzzU000003zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
HauntedAcademy := "|<>*87$137.zzzzzzzzzzzwzzzzzzzbzzzwSDzzzzyDzzkzszzzzy7zzzswTzzzzwTzzVzlzzzzwDzzzlszzzzzszzz3z1zzzzsTzzzXlsaSN7UQ7k7y3wDWS0sCFz03UAQE20k70Ds3kC0s10A0y060MsU410A0Tl70M1U60M1w0AMll6CCAMlz26BlX6AMl3swFlXWCAM0lXy08T76AE1X7lslX64QMszX7s08z6AMkD6DXlU608skkr0DlwE60M1VCAT7XUC0FlUU70T3sEC0s30AMyTbWS9bbVkT4zDtky9sbUtn"

cancel_boton := "|<>*138$82.zzwDzzzzzzzszzzz0DzzzzzzzXzzzs0TzzzzzzyDzzz01zzzzzzzszzzsDjzzzzrz7XzzzVzw0k3w3k6DzzyDzU307U60Mzzzszw0A0A0kEXzzzXzkkkkkz72DzzyDz7X7X7w08zzzsTwQASATk1XzzzkMk0lskX3y7zzz01037X040MDzzy060ASC0M1Uzzzy1y8lsy7k73zU"

PlanetGreenie := "|<>*90$137.zzwTzzzzzzzzzzzzzzzyDzzw0szzzzzzDzs3zzzzzzwTzzs0lzzzzzyDz03zzzzzzszzzk1XzzzzzwTy0DzzzzzzzzzzXV7zzzzXszsSTnszXvzzszz7WD0A0w10Dlzs30Q1U770TyC4Q0M1k20TXUk40k30CA0Tw0Ms0k1V21y61UMEV20AMEzs0lllXX66DyC37lV64QMlVzk3XXX760QTwT6D060Msl07zXz766CATszsSAT7wTllX7zz7y60AQM1kTs0My0M1XX60TyDw60Mss3Uzs0ly0s376C0zwTwS8lls7lzs7Xy1s6CAS1y"
WalledCity := "|<>*90$137.zzzzzsnzzz7zzwTzzzzzzzzwyTDzlXzzyDz0stzzzzzzzzksQDzX7zzwTw0Flzzzzzzzzlkszz6Dzzszk0zXzzzzzzzzXVlzyATXzlz3nz7rrzzzzzz2130AMw1k3yDy8073zzzzzz42A0Mlk307wTwE2CDzzzzzy00M0lXV20DkzskA8Tzzzzzw30llX764QTlzllwEzzzzzzw63XX6C0MszXzXXs3zzzzzzsA766AQTlVz3n77s7zzzzzzswS0A881U3z02C3kTzzzzzzlsy0MEM3U7z0AQ7kzzzzzzzbty8sks7WDz0syDXzzzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzzwTzzzzzzzzzzzzzzzzzzzzzszzzzzzzzzzzzzzzzzzzzzznzzzzzzU"
SnowyTown := "|<>*89$137.z0zzzzzzzzz00Tzzzzzzzzzw0zzzzzzzzy00zzzzzzzzzzs1zzzzzzzzzsTzzzzzzzzzzlzzzsyzvjjzlz7rzTzzzzzzVz0D0FlUC7zXs2CAE3zzzzz0S0Q0V24QTz7U48EU7zzzzz0Q0M0W4MMzyD04EX07zzzzzUMsll00sXzwSC806CDzzzzzsllXX01k7zswQM0AQTzzzzllXX7607kDzlssk0sszzzzzU3760C4DkzzXk1kVllzzzzz0CCC0wMzVzz7k7X7XXzzzzzUwQS3wtz7zyDkTbD77zzzzzzzzzzzzwDzzzzzzzzzzzzzzzzzzzzzszzzzzzzzzzzzzzzzzzzzzzlzzzzzzzzzzzzzzzzzzzzzzbzzzzzzzzzzzzzk"
SandVillage := "|<>*90$137.zzzzzzzlzzzlXDzzzzzzzzzy1zzzzzXyTtX6Dzzzzzzzzzs1zzzzz7sTV6ATzzzzzzzzzk3zzzzyDsz7wMzzzzzzzzzzXzzzzzwTkwDslzvzrszzzzz3z0A0w0zlsslXk3U70Tzzzy0w0M1k1zVVlX7060A0zzzzy0s0k1U3zX7X6C0A0MEzzzzz0llXX77z2D6AQMMklVzzzzzlXX76CDz0yAMssll07zzzzXX66CAMTy1wMllVV37zzzzz060AQM0zy7skUU3060Tzzzy0S0Mss1zwDlV1U70C0zzzzz1y8nlsXzwzXX3WDYS1zzzzzzzzzzzzzzzzzzzxkzzzzzzzzzzzzzzzzzzzzzs3zzzzzzzzzzzzzzzzzzzzzU7zzzzzzzzzzzzzzzzzzzzzkzzzzzzU"
NavyBay := "|<>*93$137.yDXzzzzzzU7zzzzzzzzzzzzwD7zzzzzz07zzzzzzzzzzzzsSDzzzzzy07zzzzzzzzzzzzkQTzrvjjwQDzvvzzzzzzzzzUMs1DUSDssQ03Vzzzzzzzzz0FU0C4QTl1k177zzzzzzzzy8X04QMMzW3U26DzzzzzzzzwE6CAEsXz73768zzzzzzzzzskAQM3k7yD6CA1zzzzzzzzzlkMks7kDwSAMQ3zzzzzzzzzXkk1kTkzs0M0wDzzzzzzzzz7lk3kzVzk1s1sTzzzzzzzzyTXl7nz7zU7sXlzzzzzzzzzzzzzzzwDzzzzz3zzzzzzzzzzzzzzzszzzzzyDzzzzzzzzzzzzzzzlzzzzzwTzzzzzzzzzzzzzzzbzzzzztzzzzzzzzzk"
FiendCity := "|<>*89$137.zzwTzzzz7zzwTzzzzzzzzzzw08zzzzyDz0stzzzzzzzzzzs0FzzzzwTw0Flzzzzzzzzzzk0zzzzzszk0zXzzzzzzzzzzXzzlzzzlz3nz7rrzzzzzzzz7yC0k3k3yDy8073zzzzzzzy0QM1U707wTwE2CDzzzzzzzw0skV060DkzskAATzzzzzzzs1lX2CAQTlzllwFzzzzzzzzlzX0AQMszXzXXs3zzzzzzzzXz6DsslVz3n77s7zzzzzzzz7yA0llU3z02C3sTzzzzzzzyDwQ1XXU7z0AQ7kzzzzzzzzwTsw377WDz0syDXzzzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzzwTzzzzzzzzzzzzzzzzzzzzzszzzzzzzzzzzzzzzzzzzzzznzzzzzzzzU"
SpiritWorld := "|<>*89$137.zzzzlzszzzzzzzzszszzzzzy1zzXzlnzntwzzzlzlzzzzzs1zz7zXXz3VkzzzXzXzzzzzk3zzzzz7z73Xzzz7z7zzzzzXzzzzbyDyC77XzaDyDzzzzz3y0sk4E3w84A1k4S0Tzzzzy0w0lU8U7wE8k3U8s0zzzzzy0s0X0lUTs01U30lk1zzzzzz0ll6DXXzkA376DXXXzzzzzzlXWAT77zkMCCAT777zzzzzXX24MyCDzUkQQMyCADzzzzz060MlwQ7z3ls0lwA0Tzzzzy0Q0lXssDz7Xs3XsA0zzzzzz1sbX7lwTyTbsD7swFzzzzzzzlzzzzzzzzzzzzzzzzzzzzzzXzzzzzzzzzzzzzzzzzzzzzz7zzzzzzzzzzzzzzzzzzzzzyDzzzzzzzzzzzzzzzzzzzU"
AntKingdom := "|<>*89$137.zzzzzzzzz7zzzzszzzzzzzzztzzzDz7aDzzzzlzzzzzzzzzVzzyDyC4TzzzzXzzzzzzzzz3zzwTwMTzzzzz7zzzzzzzzw3zzszsVzzzzjyDXzzjzzzzs7k30Dk7X0D0C0Q1k47zzzzU7U60TUT60Q0M0k1U0Dzzzz6D061z0yA0M0k1U300TzzzwACCCDy0wMslVXX76AMTzzzs0QQQTw0sllXX76CAMkzzzzU0MsszsVlXX26AAQMlVzzzz7sllkTlVX760A0M0lX3zzzwDlXXUzXV6CC0Q0s3X67zzzwzn77lz7aAQT8wFsD6CTzzzzzzzzzzzzzzvVzzzzzzzzzzzzzzzzzzzzzk7zzzzzzzzzzzzzzzzzzzzz0DzzzzzzzzzzzzzzzzzzzzzVzzzzzzzzzzU"
MagicTown := "|<>*92$137.zzzzzzzXzzzzzzzzzzzzzzzwTszzzz7zz00TzzzzzzzzzzsTVzzzyDzy00zzzzzzzzzzzky3zzzzzzzszzzzzzzzzzzzUs7zzzzzTzlz7rzTzzzzzzz0kC0Q0lkDzXs2CAE3zzzzzy00M0k1X0Dz7U48EU7zzzzzwE8k1U360zyD04EX07zzzzzsklXX66ATzwSC806CDzzzzzlXX76CAMzzswQM0AQTzzzzzXz6AAMMlbzlssk0sszzzzzz7yA0M0lU7zXk1kVllzzzzzyDwQ0s1XUDz7k7X7XXzzzzzwzswFxX7VzyDkTbD77zzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzz0Tzzzzzzzzzzzzzzzzzzzzw0zzzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzU"
HauntedAcademy := "|<>*87$137.zzzzzzzzzzzwzzzzzzzbzzzwSDzzzzyDzzkzszzzzy7zzzswTzzzzwTzzVzlzzzzwDzzzlszzzzzszzz3z1zzzzsTzzzXlsaSN7UQ7k7y3wDWS0sCFz03UAQE20k70Ds3kC0s10A0y060MsU410A0Tl70M1U60M1w0AMll6CCAMlz26BlX6AMl3swFlXWCAM0lXy08T76AE1X7lslX64QMszX7s08z6AMkD6DXlU608skkr0DlwE60M1VCAT7XUC0FlUU70T3sEC0s30AMyTbWS9bbVkT4zDtky9sbUtn"
MagicHills := "|<>*90$137.zzzzzzzXzzzzslbzzzzzzzzwTszzzz7zzXslX7zzzzzzzzsTVzzzyDzz7lX6Dzzzzzzzzky3zzzzzzyDXyATzzzzzzzzUs7zzyzyTwT7wMyDzzzzzzz0kC0Q0lkDsyAMlk7zzzzzzy00M0k1X0Dk0MlXUDzzzzzzwE8k1U360zU0lX77zzzzzzzsUlXX66ATz01X6C1zzzzzzzlXX76CAMzyDX6AS1zzzzzzzXz6AAMMlbwT6AMz3zzzzzzz7yA0M0lU7syAMEF7zzzzzzyDwQ0s1XUDlwMkUUDzzzzzzwTswFwX7UzXsllVUzzzzzzzzzzzzi7zzzzzzzzzzzzzzzzzzzzz0Tzzzzzzzzzzzzzzzzzzzzw0zzzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzU"
SpaceCenter := "|<>*89$137.z0zzzzzzzzw3zzzyDzzzzzzw0zzzzzzzzk1zzzwTzzzzzzs1zzzzzzzz03zzzszzzzzzzlzzzzzrwTwDDXzzlz7qTzzzVz0S0Q3UDszw1U60M30Tzzz0S0M0k20Tlzk30A0U60zzzz0Q0E1UA8T3zV20A3243zzzzUMsXX7skz7z64QQSA8zzzzzsll76Dk3yDy0Msss0lzzzzllV2AANXzwDATlllszXzzzzU30A0M10Dw081XXUk37zzzz0C0w0s30Tw0s3771k6DzzzzUwHwFsD0zw3s6CDXkATzzzzzszzzzzzzzzzzzzzzzzzzzzzlzzzzzzzzzzzzzzzzzzzzzzXzzzzzzzzzzzzzzzzzzzzzz7zzzzzzzzzzzzzzzzzzzk"
AlienSpaceship := "|<>*89$137.zzz77zzzzzzzzzzzzzzXz7zztyCDzzzzUTzzzzzzzz7yDzzVwQTzzzy0TzzzzzzzyDwTzz3szzzzzw0zzzzzzzzwTzzzw3lzwTzzszzzzznyDlszzzzs7XXUA0zkzUD0C1k60k3X0zU7760M1zUD0A0M10A1U761z6CCA8E1zUC080k648z06A3wAAQMkXXzkAQFVXwMECCAMzs0Msk377zwMsXX7s1kAQMlzU0FlXyCDsskV66AlzsMslVT7sVX0AQTk1U60A0U68llX0wDl170MszU70C0Q1UA1XX61wzn6D0llzkS9y8w7UQ776AHzzzzzzzzzzwTzzzzzzzzzszzzzzzzzzzzszzzzzzzzzzlzzzzzzzzzzzlzzzzzzzzzzXzzzzzzzzzzzXzzzzzzzzzz7U"
FabledKingdom := "|<>*91$137.zzzzlzXzzyDzzlzzzzyDzzzw0DzXz7zzwTltXzzzzwTzzzs0Tz7yDzzszXV7zzzzszzzzk0zyDwTzzlz67zzzzzlzzzzXzzwTsz7zXy8TzzzvzXszzz7y0M3ls3U7w1sk3k3U70Q1y0M0k3XU60Ds7lU7060A0M1w0k1U37240TkDX060A0M0k3s1XX76CA8szUD6CAMMsllX7lz76CAQ0llz0CAQMsllXX6DXyAA8MszX3y8QMskVX376AT7w0M0kkX07wMMllU3060AMyDw0k3Uk70DssFXXU70C0slwTwFUDXkD4TltX77WD4S3lXzzzzzzzzzzzzzzzysTzzzzzzzzzzzzzzzzzzzzw1zzzzzzzzzzzzzzzzzzzzzk3zzzzzzzzzzzzzzzzzzzzzsTzzzzzU"
RuinedCity := "|<>*88$137.zzzzszzzzyDzzszzzzzzzzzw0zzlzzzzwTy1lnzzzzzzzzs0zzXzzzzszs0XXzzzzzzzzk1zzzzzzzlzU1z7zzzzzzzzXVzzzzz7zXy7byDjjzzzzzz7WCAM1s3U7wTwE0C7zzzzzyC4QMk3U60DszsU4QTzzzzzw08slU3240TVzlUMEzzzzzzs0llX76A8szXzXXsVzzzzzzk1XX6CA0llz7z77k7zzzzzzXX66AQMzX3y7aCDkDzzzzzz720AMsk307y04Q7UzzzzzzyD60Mllk70Dy0MsDVzzzzzzwSS8lXXkD4Ty1lwT7zzzzzzzzzzzzzzzzzzzzzwDzzzzzzzzzzzzzzzzzzzzzszzzzzzzzzzzzzzzzzzzzzzlzzzzzzzzzzzzzzzzzzzzzzbzzzzzzU"
PuppetIsland := "|<>*91$137.zzzzzzzzzzzzzz7zzzzwTzzw0zzzzzzztzszyDzzzzszzzs0zzzzzzzlzlzwTzzzzlzzzk1zzzzzzzXzXzszzzzzXzzzXVzzzzzwT7z7Xlzvzzz7zzz7WCA1k7U81yA1Xk30D0DzzyC4QM1U60E3wM37060Q0Tzzw0Msk1048EDslyC0A0M0zzzs0llXWC8klzlUQQMMsllzzzk3XX74QE3XzXUMksllXXzzzXz6648EXz7z7kllVXX67zzz7y0A0k32C3yAFVU3760DzzyDy0M3UD0Q7wM31U6CC0TzzwTy8lD4z0yDssD7WAQS8zzzzzzzXyDzzzzzzzzzzzzzzzzzzzz7wTzzzzzzzzzzzzzzzzzzzyDszzzzzzzzzzzzzzzzzzzzwTlzzzzzzzzzzzzzzzzU"
VirtualDungeon := "|<>*87$137.zzzXzzzzzzlzzzzzzzzzzzzwzn7znzzzzXz0Dzzzzzzzzzkz2DzXzzzz7y0DzzzzzzzzzlyDzz7zzzyDw0DzzzzzzzzzVsTzCDzzzwTssCyxzzvwTlzXllU02CC0MzlsMsk3k3UC0z33X004QM0lzXsllU7060M1z6D61UMsk1Xz7lXX060A8E3y4SATXllXX7yDX76CAMMkXby1wMz7XX76DwS6CAQMsU37Dw3slyD26AATssQ8MskVXyCTwDlXw60A0MTk0s0llU30A0zsTX7sC0Q0kTU3s1XXU70Q1ztz6DwS8wFlz0TsX77WD0w7zzzzzzzzzzzzzzzzzysTzzzzzzzzzzzzzzzzzzzzs1zzzzzzzzzzzzzzzzzzzzzk3zzzzzzzzzzzzzzzzzzzzzsTzzzU"
SnowyKingdom := "|<>*87$137.zzzzzzzzzzzzz7zzzzszzzzy1zzzzzzzzz7aDzzzzlzzzzs1zzzzzzzzyC4TzzzzXzzzzk3zzzzzzzzwMTzzzzz7zzzzXzzzlxzrTTsVzzzzjyDXxjz3y0S0XX0QDk7X0D0C0Q1k4y0w0s1248szUT60Q0M0k1U1y0s0k148klz0yA0M0k1U303z0llXW01l7y0wMslVXX76ATzlXX7603UDw0sllXX76CAMzXX76CA0DUTsVlXX26AAMMlz06CA0Q8TVzlVX760A0M0lXy0QQQ1slz3zXV6CC0Q0s3X7z1ssw7tnyDz7aAQS8wFsD6DzzzzzzzzsTzzzzzvVzzzzzzzzzzzzzzlzzzzzzk7zzzzzzzzzzzzzzXzzzzzz0DzzzzzzzzzzzzzzDzzzzzzVzzzzzzU"
DungeonThrone := "|<>*87$137.zzzzzzzzzzzzzzzzyDzzzzzw0zzzzzzzzzzzzk04Tzzzzzs0zzzzzzzzzzzzU08zzzzzzk0zzzzzzzzzzzzy7lzzzzzzXUzzzzzjlz7zzzwTXzwyDrz7VXX0D0C0s3U7zsz0C0k70yDX760Q0M1U30Dzly0Q1061wT6CA0M0kV060DzXw0M60A3syAQMslVX2CAQTz7sslwQMzlsMsllXX0AQMszyDllXkslzXVkVXX66DssllzwTXX7llXz03U3760A0k1XXzsz76DU37y0DU6CC0Q1k777zlyCATUCDw1zWAQT8w3kSCDzXwQMzUwTzzzzzzvVzzzzzzzzzzzzzzzzzzzzzk7zzzzzzzzzzzzzzzzzzzzz0DzzzzzzzzzzzzzzzzzzzzzVzzzzzzzzzzzzzzzU"
MountainTemple := "|<>*88$137.zzzzzzzzzzzzXzzzzzzzzzzwTszzzzzzDzz7zzk07zzzzzsTVzzzzzyDzyDzzU0Dzzzzzky3zzzzzwTzzzzzy7zzzzzzUs7lzzzzszzzzzzwTlzzjzz0kC0ssk30A0lU7zsy0k460y00M1llU60E1X0Dzls1U0A1wE8k1XX061U360DzXkV00M3sUlXX76CCD76AQTz7X2AMFrlXX76CAQQQCAMszyC0AMkXjXz6CA8MsswMMllzwSDslV2T7yA0M0llkM0lXXzsw0lX20yDwQ1s1XXUs1X77zlw1X641wTsw7sX77lsX6CDzXw36CMbzzzzzzzzzzzzzzzzzzzzzlzzzzzzzzzzzzzzzzzzzzzzXzzzzzzzzzzzzzzzzzzzzzz7zzzzzzzzzzzzzzzzzzzzzyDU"
RainVillage := "|<>*86$137.zzzzszzzzzlXDzzzzzzzzzzw0zzlzzyTtX6Dzzzzzzzzzzs0zzXzzsTV6ATzzzzzzzzzzk1zzzzzsz7wMzzzzzzzzzzzXVzzzzzkwDslzvzrszzzzzz7X0AM1zlsslXk3U70TzzzzyC40Mk3zVVlX7060A0zzzzzw080lU3zX7X6C0A0MEzzzzzs0llX77z2D6AQMMklVzzzzzk1XX6CDz0yAMksll07zzzzzXX66AQTy1wMllVV37zzzzzz720AMszy7skUU3060TzzzzyD60MllzwDlV1U70C0zzzzzwSC8lXXzwzXX3WD4S1zzzzzzzzzzzzzzzzzzzxkzzzzzzzzzzzzzzzzzzzzzs3zzzzzzzzzzzzzzzzzzzzzU7zzzzzzzzzzzzzzzzzzzzzkzzzzzzzU"




global verificaçao_de_caminho := 0
global lose_streak := 0

SetupMacro() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    if WinExist(RobloxWindow) {
        WinActivate(RobloxWindow)
        Sleep 50
        WinMove(27, 15, 800, 600, RobloxWindow)
        Sleep 50
    }
    if WinExist("Taxi Winter Event Farm") {
        Sleep 50
        WinActivate("Taxi Winter Event Farm")
        Sleep 100
    }
}

InitializeMacro() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    global MacroStartTime := A_TickCount

    if WinExist("Taxi Auto-Challenge") {
        WinActivate("Taxi Auto-Challenge")
    }

    if WinExist(RobloxWindow) {
        WinMove(27, 15, 800, 600, RobloxWindow)
        WinActivate(RobloxWindow)
        Sleep 100
    }
    else {
        MsgBox("You must have ROBLOX open in order to start the macro (microsoft roblox doesnt work)", "Error T4", "+0x1000",)
        return
    }

    if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText)) {
        GoToRaids()
    }
    else {
        MsgBox("You must be in the lobby with default camera angle to start the macro.", "Error T3", "+0x1000",)
        return
    }
}

SetDefaultKeyboard(localeID) {
    static SPI_SETDEFAULTINPUTLANG := 0x005A, SPIF_SENDWININICHANGE := 2
    Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
    binaryLocaleID := Buffer(4, 0)
    NumPut("UInt", LocaleID, binaryLocaleID)
    DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "Ptr", binaryLocaleID, "UInt", SPIF_SENDWININICHANGE)
    for hwnd in WinGetList()
        PostMessage 0x50, 0, Lan, , hwnd
}

BetterClick(x, y, LR := "Left") { ; credits to yuh for this, lowk a life saver
    MouseMove(x, y)
    MouseMove(1, 0, , "R")
    MouseClick(LR, -1, 0, , , , "R")
    Sleep(50)
}

GoToRaids() {
    SendInput ("{Tab}")
    AddToLog("For support, make sure to click on the discord icon above")
    loop {
        

            if (ok := FindText(&X, &Y, 361, 542, 507, 596, 0, 0, cancel_boton)) {   
                    if (!ok := FindText(&X, &Y, 60, 278, 196, 303, 0, 0, HauntedAcademy)){
                        BetterClick(408,520)
                    } 
                loop{
                    Sleep 3000
                    AddToLog ("esperand sair  da capsula")
                    if (!ok := FindText(&X, &Y, 361, 542, 507, 596, 0, 0, cancel_boton)){
                        Sleep 1000
                        AddToLog  ("esperando entrar na fase") 
                        

                        break
                    }
                }
                break
            }
        
        
            if (ok := FindText(&X, &Y, 10, 70, 350, 205, 0, 0, LoadingScreen)) {
                AddToLog("Found LoadingScreen, stopping loop")
                break
            }
            if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
                AddToLog("Found VoteStart, stopping loop")
                break
            }
            if (ok := FindText(&X, &Y, 338, 505, 536, 572, 0, 0, ClaimText)) ; daily reward
            {
                BetterClick(406, 497)
                Sleep 3000
            }

        AddToLog("Attempting to go to raids...")

        ; go to play area
        BetterClick(89, 302) ; play
        Sleep 1000
        HoldKey("d", 1600)
        Sleep 500
        HoldKey("w", 2400)
        Sleep 1000
        ; HoldKey("d", 2000)
        ; Sleep 500
  
        loop 5 {
               if ( FindText(&X, &Y, 60, 278, 196, 303, 0, 0, PlanetGreenie) 
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, WalledCity) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, SnowyTown) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, SandVillage) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, NavyBay) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, FiendCity) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, SpiritWorld) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, AntKingdom) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, MagicTown) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, MagicHills) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, SpaceCenter) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, AlienSpaceship) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, FabledKingdom) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, RuinedCity) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, PuppetIsland) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, VirtualDungeon)) {
                    BetterClick(408,520)
                }

        }



        BetterClick(720, 241) ; namek planet thing
        Sleep 1000

        loop 2 {
            Sleep 150
            SendInput ("{WheelDown 1}") ; Scrolling to reach Haunted Acadamy Box
        }

        BetterClick(700, 425) ; Haunted Academy Box
        BetterClick(700, 425)
        Sleep 400

        BetterClick(290, 240) ; Infinite
        Sleep 1000

        BetterClick(400, 439) ; play
        Sleep 500

        BetterClick(340, 325)
        sleep 600

        BetterClick(400, 460) ; cancel
        Sleep 200
    }


    
   
    LoadedLoop()
    OnSpawnSetup()
    PressVoteStart()
    StartedLoop()
    TryPlacingUnits()

}

Replaying() {
    loop {
        if (ok := FindText(&X, &Y, 10, 70, 350, 205, 0, 0, LoadingScreen)) {
            AddToLog("Found LoadingScreen, stopping loop")
            break
        }
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
            AddToLog("Found VoteStart, stopping loop")
            break
        }
        Reconnect()
        sleep 1000 ; cd wont spam loops
    }
    LoadedLoop()
    OnSpawnSetup()
    
    PressVoteStart()
    StartedLoop()
    TryPlacingUnits()
}

StopMacro() {
    SaveLocal
    if ControlGetVisible(keybindsGui) {
        return
    }
    Reload()
}
; Define the rectangle coordinates
global startX := 200, startY := 290, endX := 450, endY := 200
global step := 50 ; Step size for grid traversal
global successfulCoordinates := [] ; Array to store successful placements
global successThreshold := 3 ; Number of successful placements needed
global Hillx := 0
global Hilly := 0

PlaceHillUnit(slot := 1) {
    global Hillx
    global Hilly
    SendInput(slot)
    Sleep 100
    PixelSearch(&Hx, &Hy, 400, 160, 600, 235, 0x06B10E, 5)
    Sleep 100
    BetterClick(Hx, Hy)
    Sleep 100
    SendInput("q")

    if IsPlacementSuccessful() {
        Sleep 15
        Hillx := Hx
        Hilly := Hy
        return true
    }
    return false
}

PlaceUnit(x, y, slot := 1) {
    SendInput(slot)
    Sleep 50
    BetterClick(x, y)
    Sleep 50
    SendInput("q")

    ; Check if placement is successful
    if IsPlacementSuccessful() {
        Sleep 15
        return true
    }
    return false
}

IsPlacementSuccessful() {

    Sleep 3000
    if (ok := FindText(&X, &Y, 78, 182, 400, 451, 0, 0, UnitExistence)) {
        AddToLog("Placed unit successfully")
        BetterClick(329, 184) ; close upg menu
        return true
    }
    return false
}

#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\Lib\Gdip_All.ahk

TryPlacingUnits() {
    global startX, startY, endX, endY, step, successfulCoordinates, Hillx, Hilly
    successfulCoordinates := [] ; Reset successfulCoordinates for each run

    x := startX ; Initialize x only once
    y := startY ; Initialize y only once

    ; Iterate through all slots (1 to 6)
    for slotNum in [1, 2, 3, 4, 5, 6] {
        enabled := "Enabled" slotNum
        enabled := %enabled%
        enabled := enabled.Value
        hill := "Hill" slotNum
        hill := %hill%
        hill := hill.Value
        placements := "Placement" slotNum
        placements := %placements%
        placements := placements.Text


        ; Skip if the slot is not enabled
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0

        if (hill = 1) {
            while (placementCount < placements) {
                if PlaceHillUnit(slotNum) {
                    placementCount++
                    successfulCoordinates.Push({ x: Hillx, y: Hilly })
                    AddToLog("Placed " placementCount "/" placements ".")
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(210, 555) ; move mouse
                if ShouldStopUpgrading(1) {
                    AddToLog("Stopping due to finding lobby  condition.")
                    return Replaying()
                }
                Reconnect()
            }
        }

        ; Continue placement for the current slot
        if !(hill = 1) {
            while (placementCount < placements && y >= endY) { ; Rows
                while (placementCount < placements && x <= endX) { ; Columns
                    x += step - 20 ; Move to the next column
                    if PlaceUnit(x, y, slotNum) {
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                    }
                    if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                    {
                        BetterClick(373, 237)
                    }
                    BetterClick(565, 563) ; move mouse
                    if ShouldStopUpgrading(1) {
                        AddToLog("Stopping due to finding lobby  condition.")
                        return Replaying()
                    }

                    Reconnect()

                }
                if x > endX {
                    x := startX ; Reset x for the next row
                    y -= (-step - 25) ; Move to the next row
                }
            }
            Reconnect()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        Reconnect()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}


UpgradeUnits() {
    global successfulCoordinates

    AddToLog("Beginning unit upgrades.")

    while true { ; Infinite loop to ensure continuous checking
        for index, coord in successfulCoordinates {

            UpgradeUnit(coord.x, coord.y)

            if ShouldStopUpgrading() {
                AddToLog("Found return to lobby, going back.")
                successfulCoordinates := []
                return Replaying()
            }

            if IsMaxUpgrade() {
                AddToLog("Max upgrade reached for: X" coord.x " Y" coord.y)
                successfulCoordinates.RemoveAt(index) ; Remove the coordinate
                continue ; Skip to the next coordinate
            }

            Sleep(200)
            if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
            {
                BetterClick(373, 237)
            }
            BetterClick(565, 563) ; move mouse
            Reconnect()
        }

        ; If all units are maxed, still check for stopping condition
        if successfulCoordinates.Length = 0 {
            Reconnect()
            BetterClick(720, 510)
            if ShouldStopUpgrading() {
                AddToLog("Stopping due to finding return to lobby button.")
                return Replaying()
            }
            Sleep(2000) ; Prevent excessive looping

        }

        Reconnect()
    }
}


UpgradeUnit(x, y) {
    BetterClick(x, (y - 3))
    BetterClick(264, 363) ; upgrade
    BetterClick(264, 363) ; upgrade
    BetterClick(264, 363) ; upgrade
}

IsMaxUpgrade() {
    Sleep 500
    if (ok := FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade) or (ok := FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade2)) or (ok := FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade3)))
    {
        return true
    }
}

ShouldStopUpgrading(sleepamount := 300) {
    Sleep sleepamount
    if CheckForReplayButton() {
        if (WebhookCheckbox.Value = 1) {
            SendWebhook()
        }
        BetterClick(485, 115)
        return true
    }
}

OnSpawn() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    OnSpawnSetup()
}

LookDown() {
    MouseMove(400, 300)
    loop 20 {
        SendInput("{WheelUp}")
        Sleep 50
    }
    Sleep 200
    MouseGetPos(&x, &y)
    MouseMove(400, 300)
    SendInput(Format("{Click {} {} Left}", x, y + 150))

    loop 20 {
        SendInput("{WheelDown}")
        Sleep 50
    }
}

LoadedLoop() {
    AddToLog("Waiting to load in")
    loop {
        Sleep 100
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart))
        {
            AddToLog("Loaded in")
            Sleep 100
            break
        }
        Reconnect()
    }
    chat := ChatToSend.Value
    if (ChatStatusBox.Value = 1 && StrLen(chat) > 0) {
        AddToLog("Sending chat")
        SendChat()
    }
}

PressVoteStart() {
    sleep 1000
    BetterClick(350, 103) ; click yes
    BetterClick(350, 100) ; click yes
    BetterClick(350, 97) ; click yes
}

StartedLoop() {
    loop {
        Sleep 100
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart))
        {
            continue
        }
        AddToLog("Game started")
        break
    }
}

LobbyLoop() {
    loop {
        Sleep 1000
        if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText))
        {
            break
        }
        Reconnect()
    }
    AddToLog("Returned to lobby, going back to raids")
    return GoToRaids()
}

CheckForLobbyButton() {
    if (ok := FindText(&X, &Y, 273, 103, 482, 214, 0, 0, LobbyText))
    {
        return true
    }
}

Checkforloss() {
    if (ok := FindText(&X, &Y, 412 - 150000, 109 - 150000, 412 + 150000, 109 + 150000, 0, 0, DeathText))
    {
        return true
    }
    return false
}

CheckForReplayButton() {
    IsFound := CheckforNextButton()
    if !IsFound {
        return false
    }
    if (ok := FindText(&X, &Y, 435 - 150000, 168 - 150000, 435 + 150000, 168 + 150000, 0, 0, ReplayText)) {
        return true
    }
    return false
}

CheckforNextButton() {
    NextButton := "|<>*124$49.70s000007ly0003s6AnU001y33Mk001X1VwNyCClkkSDzzjsyM77UQyM3A1XU4C81a0lU3040n40llk7VtX0M0w7lslkA0S3swMs6Dy0wCQS30C0C1yDVk277Uz7sw3bnszzzzzzzzzzzzzzzzzU"

    if (ok := FindText(&X, &Y, 355 - 150000, 441 - 150000, 355 + 150000, 441 + 150000, 0, 0, NextButton)) {
        AddToLog("Found button, checking for replay next")
        loop 5 {
            BetterClick(348, 391) ; next
            Sleep 200
        }
        Sleep 2000
        return true
    }
    return false
}

SendChat() {
    SendInput("/")
    Sleep 250
    chat := ChatToSend.Value
    if (ChatStatusBox.Value = 1 && StrLen(chat) > 0) {
        for char in StrSplit(chat) {
            Send(char)
            Sleep(Random(100, 200))  ; Optional delay between each keypress
        }
    }
    Sleep 1200
    SendInput("{Enter}")
    Sleep 250
}

TPtoSpawn() {
    BetterClick(27, 574) ; setings
    Sleep 1000

    BetterClick(400, 287)
    Sleep 600
    loop 5 {
        Sleep 150
        SendInput("{WheelDown 1}") ; scroll
    }
    Sleep 600
    BetterClick(523, 221) ; tp to spawn
    Sleep 600
    BetterClick(582, 150) ; exit settings

}

DebugOCR() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    ocrResult := OCR.FromRect(266, 309, 603 - 266, 352 - 309, , 2)

    if ocrResult {
        BetterClick(414, 342)
        AddToLog("Captcha Detected: " ocrResult.Text)

        ; Clean up the captcha string
        captcha := StrReplace(ocrResult.Text, " ")  ; Remove spaces
        if (StrLen(captcha) <= 1 || RegExMatch(captcha, "[A-Za-z]")) {
            AddToLog("invalid captcha retrying")
        }

        ; Remove special characters like /, -, and .
        captcha := RegExReplace(captcha, "[/.\-_,]")

        ; Send each character
        Send(captcha)
        ;for char in StrSplit(captcha) {
        ;    Send(char)
        ;    Sleep(Random(25, 75))  ; Optional delay between each keypress
        ;}
    } else {
        AddToLog("NO CAPTCHA FOUND.")
    }
}

AntiCaptcha() {
    ; Perform OCR on the defined region directly
    ocrResult := OCR.FromRect(266, 309, 603 - 266, 352 - 309, , 2)

    ; Display OCR results
    if ocrResult {
        BetterClick(414, 342) ; Click to focus on captcha input
        AddToLog("Captcha Detected: " ocrResult.Text)

        ; Clean up the captcha string
        captcha := StrReplace(ocrResult.Text, " ")  ; Remove spaces
        if (StrLen(captcha) <= 1 || RegExMatch(captcha, "[A-Za-z]")) {
            AddToLog("invalid captcha retrying")
            BetterClick(584, 192) ; close captcha
            return
        }

        ; Remove special characters like /, -, and .
        captcha := RegExReplace(captcha, "[/.\-_,]")

        ; Send each character
        Send(captcha)
        ;for char in StrSplit(captcha) {
        ;    Send(char)
        ;    Sleep(Random(25, 75))  ; Optional delay between each keypress
        ;}
    } else {
        AddToLog("NO CAPTCHA FOUND.")
    }

    BetterClick(309, 386) ; select
    Sleep 1500
    BetterClick(383, 221)
    Sleep 500

    sleep 6000
    if (ok := FindText(&X, &Y, 10, 70, 350, 205, 0, 0, LoadingScreen)) {
        return
    }
    if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
        return
    }
    AddToLog("Walking to ensure the UI pops up again if it didnt matchmake")

    loop 2 {
        HoldKey("D", 400)
        HoldKey("A", 800)
        HoldKey("Space", 2000)
    }

    Sleep 1500
    if (ok := FindText(&X, &Y, 221, 206, 403, 355, 0, 0, MatchmakeUI))
    {
        AddToLog("Waiting for captcha cooldown then retrying")
        Sleep 6000
    }
    return
}

OnSpawnSetup() {
    global
    SendInput ("{Tab}")
    TPtoSpawn()
    Sleep 1000
    LookDown()
    Sleep 1000
    loop {
        Sleep 1000
        if PixelSearch(&Px, &Py, 385, 0, 430, 25, 0x091512) {
            AddToLog("Correct Angle")
            break
        }
        else {
            if PixelSearch(&Px, &Py, 757, 331, 824, 439, 0x091512, 10) {
                global verificaçao_de_caminho := 1  
                break
            }
            AddToLog("Incorrect Angle. Performing 90-degree turn.")
            ; Simulate pressing the "Left" key for a 90-degree turn
            SendInput("{Left down}")  ; Hold the "Left" key down
            Sleep 750                 ; Adjust this value to control the turn duration (90 degrees)
            SendInput("{Left up}")    ; Release the "Left" key

            ; Ensure the key is fully processed before proceeding
            KeyWait "Left"
            ; Optional: Add a delay after the turn if needed
        }
    }
    if (verificaçao_de_caminho = 0) {

        SendInput ("{d up}")
        Sleep 100
        SendInput ("{d down}")
        Sleep 5200
        SendInput ("{d up}")
        KeyWait "d"
    }
    else {
        SendInput ("{s up}")
        Sleep 100
        SendInput ("{s down}")  
        Sleep 5200
        SendInput ("{s up}")
        KeyWait "s"
        loop 3 {
            SendInput("{Left down}")  ; Hold the "Left" key down
            Sleep 750                 ; Adjust this value to control the turn duration (90 degrees)
            SendInput("{Left up}")    ; Release the "Left" key

            ; Ensure the key is fully processed before proceeding
            KeyWait "Left"
        }
    }
}


Reconnect() {
    ; Check for Disconnected Screen
    color := PixelGetColor(519, 329) ; Get color at (519, 329)
    if (color = 0x393B3D) {
        AddToLog("Disconnected! Attempting to reconnect...")

        ; Use Roblox deep linking to reconnect
        Run("roblox://placeID=" 8304191830)
        Sleep 2000
        BetterClick(555, 444)
        if WinExist(RobloxWindow) {
            WinMove(27, 15, 800, 600, RobloxWindow)
            WinActivate(RobloxWindow)
            Sleep 5000
        }
        loop {
            AddToLog("Reconnecting to Roblox...")
            Sleep 15000
            if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText)) {
                AddToLog("Reconnected Succesfully!")
                return GoToRaids() ; Check for challenges in the lobby
            }
            else {
                BetterClick(555, 444)
                Reconnect()
            }
        }
    }
}

HoldKey(key, duration) {
    SendInput ("{" key "up}")
    ; go to teleporter
    Sleep 100
    SendInput ("{" key " down}")
    Sleep duration
    SendInput ("{" key " up}")
    KeyWait key ; Wait for "d" to be fully processed
}


