---
layout: publication
citation-key: "gibsonLabelingReligiousAffiliation2023"
title: "Labeling Religious Affiliation in Ibn Abī Uṣaybiʿa's *History of Physicians*: A Quest"
---

<span class="badge badge-pill badge-secondary">page 247</span>

Introduction: ʿUyūn al-anbā ̉ (History of Physicians) The frequent, even daily and unremarkable, contact among several religious groups in the medieval Near East is reflected in myriad texts beyond the confines of religious genres –

­ including in biographical works. These recount interactions not only between members of the three major monotheistic or »Abrahamic« religions – Judaism, Christianity, and Islam

– who have lived side-by-side for many centuries in and beyond the areas where they trace the roots of their respective faiths, but also between a number of other groups, including Zoroastrians, Manichaeans, Samaritans, and Harranian pagans or »Sabians«.

Among medieval biographical texts in Arabic, ʿUyūn al-anbā ̉ fī ṭabaqāt al-aṭibbā ̉ ­ (literally,

»Choice accounts of the classes of physicians«, hereafter abbreviated as History of­ Physicians) by the Syrian physician Ibn Abī Uṣaybiʿa (born after 590 AH/1194 CE, died 668/1269 or 1270) is perhaps unequaled in the extent to which it details the social interactions of scholars from many different religious communities. Works in this ṭabaqāt genre tend to present a kind of

»who’s who« resource, collecting information about personages in particular ­ categories such as hadith transmitters or poets. While some of these ­ categories were applicable especially within specific religious traditions, Ibn Abī Uṣaybiʿa’s project outlined a profession ­ (medicine and related areas) in which collaboration and exchange across different communities was typical. The History of Physicians is thus an ideal source for analyzing interreligious knowledge exchange on a large scale, as undertaken by the project »Communities of ­ Knowledge«

(usaybia.net).1 As a textual basis for this analysis, the recently ­ published critical ­ edition and translation of Ibn Abī Uṣaybiʿa’s work (A Literary History of Medicine, hereafter »LHOM«) was especially suitable since it is available for download and reuse as open-access under a CC-BY-NC license.[^2]

[^1]: For a more detailed introduction to the History of Physicians, see Vernet, Ibn Abī Uṣaybiʿa; the introductory essays in Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al.; and the report about the »Communities of Knowledge« project in the present volume (Gibson and Schmahl, Communities of knowledge).

[^2]: Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al. This is also the source of translated quotations below, unless otherwise noted.


<span class="badge badge-pill badge-secondary">page 248</span>

The project’s overall aim prompted the need to find a way to label the religious affiliation of persons mentioned in the History of Physicians and to address the methodological

­ considerations that go along with such a labeling system. On the whole, the »Communities of Knowledge« project aimed to examine the specific people, places, and types of ­ interactions that function to bridge religious communities as represented in Ibn Abī ­ Uṣaybiʿa’s text.[^3]

The project team identified the persons and places mentioned in chapters 8-15 of Ibn Abī

­ Uṣaybiʿa’s text in order to construct networks revealing how the author ­ depicts the ­ interactions of these persons throughout his text.[^4] But in order to be able to isolate cross-communal

­ interactions in the network, it is necessary to be able to link at least a substantial portion of the ­ approximately 3,000 individuals mentioned in the text to their respective ­ religious

­ communities. Thus, the goal of labeling persons with religious affiliations is to make the interreligious dimensions of these networks visible. The question for this paper is: How can this be done in a way that corresponds to the nuances of religious affiliation as perceived and recorded by Ibn Abī Uṣaybiʿa?[^5]

Below, I discuss the two steps involved in this linking: (1) inferring an individual’s ­ religious affiliation from the text; and (2) making this inference accessible to the network analysis in the recording system. Regarding the first step, I use examples and data from the History of Physicians to explore how a person’s religious affiliation can be determined from the text amid ambiguities and conceptual problems (such as multiple affiliation). For the second step, I describe the requirements for a system to record these determinations, and I propose a

­ model intended to meet these requirements. As a final reflection, I consider how this twostep process relates to automated tagging through named entity recognition (NER). Arabic NER models cannot yet be used in their off-the-shelf form for labeling religious affiliations, but it is conceivable to train a model on the manually ­ tagged text of the History of Physicians in order to further develop Arabic NER capabilities.

[^3]: This goal had to do not with proving whether such cross-communal collaboration took place (indeed, one might argue it was unexceptional at the time), nor with determining to whom the scholarly achievements of this ­ period belong, but rather with examining how this collaboration took place on an interpersonal level. See Gibson,­ Knowledge collaboration, 60-65.

[^4]: See the project report in this volume (Gibson and Schmahl, Communities of knowledge) for more details about identifying persons in the text and constructing networks from these identifications.

[^5]: The network constructed from the History of Physicians is meant as a tool for analyzing Ibn Abī Uṣaybiʿa’s ­ assertions. It is not in itself a historical-critical model.


<span class="badge badge-pill badge-secondary">page 249</span>

Inferring Religious Affiliation in the History of Physicians: Toward a Working Definition The challenge of linking historical persons to religiously delineated groups begins with the question of how terms such as »religion« and its corollaries »religious identity«, »religious adherence«, and »religious belonging« should be applied to medieval Near Eastern texts.

The modern definitions of these terms are actively debated in the sociology of religion.[^6]

But – more to the point – although there is some consensus that the modern concept of religion should be applied only with careful adaptation (if at all) to medieval discussions,[^7]

there has been little progress, as far as I can find, in determining in practical terms what should be seen as indicators of religious affiliation in medieval Near Eastern texts, that is, what its indicators might be. This is needed for any broad-scale study that would map these

­ communities through their individuals – through their inclusion and exclusion, what connected or ­ isolated them – in the abundant literary works and documentary texts that survive to ­ describe ­ persons from this region and time period. Without knowing clearly how to ­ detect and mark religious ­ affiliation, we are limited to guessing at larger patterns or confining ourselves to only the clear-cut cases in which terms such as »Jewish« or »Muslim« describe persons in source texts.[^8]

Regardless of this lack, many insights into cross-communal interactions have been

­ possible from studies in a number of areas: religious jurisprudence,[^9] polemical exchanges,[^10]

intertextuality in the exegesis of scripture and its narrative retellings,[^11] and others. ­ Moreover, the light that documentary and legal texts have shed on daily life has led to questioning the rigid boundaries that have sometimes been assumed for religious communities. But for

­ approaches such as prosopography or network analysis that work from references about

­ individual ­ persons toward a larger whole, systems must exist for labeling religious affiliation if interreligious dimensions are to be taken into account.

[^6]: For a summary of some of these debates, see Berger, Some second thoughts; Bruce, Defining religion; Könemann, Religion.

[^7]: See, most helpfully, the brief discussion and references in Weltecke, Über Religion vor der »Religion«, 13-15 and n. 3; as well as Bruce, Defining religion, 107-108; Könemann, Religion, 1-2; and, for a book-length treatment,­ Nongbri, _Before Religion_.

[^8]: Gero Menzel has brought to my attention that membership categorization analysis could provide a profitable methodological comparison for my approach (pers. comm., 23 May 2023; see Silverman, Harvey Sacks, 74-97). Unfortunately, I have not yet been able to explore this line of inquiry.

[^9]: E.g., Rustow, Legal status; Weitz, _Between Christ and Caliph_; and the special issue Tillier, Le pluralisme judiciaire.

[^10]: Thomas and Roggema, _Christian-Muslim Relations_ 1; Thomas et al., _Christian-Muslim Relations_ 2; Thomas and Mallett, _Christian-Muslim Relations_ 3.

[^11]: E.g., Islamic apologetic use of the Gospels (Accad, Gospels in the Muslim discourse), Islamic tellings of the ­ stories of the prophets in the qiṣās al-anbiyā ̉ genre (Nagel, Ḳiṣaṣ al-Anbiyā ̉), and the Jewish exegete Saadiah Gaon’s­ attention to Islamic theology (Freidenreich, Use of Islamic sources).

<span class="badge badge-pill badge-secondary">page 250</span>

Defining what should be considered religious affiliation in the History of Physicians

­ involves, first of all, disentangling the concept of »religion« from modern ­ preconceptions.

Indeed, it is debated when and where the idea took shape that a single term such as ­ »religion«

could encompass a plurality of systems of belief and practice.[^12] Put differently, by the ­ seventh/ thirteenth century, when Ibn Abī Uṣaybiʿa was writing, could his descriptions of people as

»Muslim«, »Christian«, »Jewish«, or »Zoroastrian« be understood as comparable terms within a single category?

Several centuries before the period of interest, in the early centuries of Islamic rule, the encounters of groups having partially conflicting and exclusivist beliefs had already

­ prompted comparative projects, such as that of Theodore Abū Qurra (d. after 213?/829?).

As the ­ Christian Melkite (Byzantine Orthodox) bishop of cosmopolitan Harran, Theodore

­ imagined what it would be like for a man who grew up on a mountain away from society to come into contact with people »in their differing religions« (fī adyānin ­ mukhtalifatin).13 He goes on to describe how each »people from« (qawm min) the pagans, Zoroastrians,

­ Samaritans, Jews, Christians, Manichaeans, Marcionites, Bardaisanites, and Muslims would attempt to recruit the newcomer to their group through their self-descriptions.[^14] Here it is not my ­ purpose to resolve whether Theodore or others of his time used the Arabic word dīn (pl. adyān) ­ analogously to the term »religion« in its modern sense.[^15] Rather, it is sufficient to note that, ­ already at this time, an author might subdivide his society into groupings that today we would call ­ »religious«, and that he seems to have considered these groups to be exclusive alternatives to one another.

Muslim writers in the third/ninth and fourth/tenth centuries wrote works describing the beliefs of various non-Muslim communities (ghayr al-Islāmiyyīn), but little ­ survives from

­ these.[^16] Remnants of a work by al-Nashī ̉ al-Akbar (d. 293/906) and the section of ʿAbd

­ al-Jabbār’s (c. 325-415/937-1024) Mughnī fī abwāb al-tawḥīd wa-l-ʿadl ­ (Compendium on the pillars of oneness and justice) dealing with religious sects show systematic ­ heresiographic

­ attempts that would later be seen in better known books in this vein by Ibn Ḥazm (384-456/994-1064) and Abū al-Fatḥ Muḥammad al-Shahrastānī (b. 479?/1086 or 1087?, ­ d.

548/1153). These efforts at clarifying which theologically distinctive features should be

­ assigned to particular groups show that, at least on this level, categorizing people into

­ communities of belief was conceivable long before the time of Ibn Abī Uṣaybiʿa.

[^12]: As Weltecke, Über Religion vor der »Religion«, has shown, current research on the origin of the concept has been too confined to studying the Latin term religio while neglecting more relevant terms such as lex as well as Arabic and other West Asian conceptions such as _milla_ and _dīn_.

[^13]: Abū Qurra, _Traité de l’existence du créateur_, ed. Dick, 200.

[^14]: Abū Qurra, _Traité de l’existence du créateur_, ed. Dick, 200-210.

[^15]: On this, see briefly Weltecke, Über Religion vor der »Religion«, 24.

[^16]: Thomas, _Christian Doctrines_, 20-22.


<span class="badge badge-pill badge-secondary">page 251</span>

While Theodore’s project and those of the abovementioned Islamic heresiographers aimed at theological persuasion, the religious categories they describe had more than just a ­ theological import. Legal reasoning in a variety of traditions demarcated these groups,

­ perhaps establishing relevant social categories or perhaps reflecting and reinforcing existing ones. Islamic jurists attempted to make group membership a criterion for rules regarding taxation, marriage, inheritance, and other areas – differentiating not only between Muslims and non-Muslims, but also between Scripture people (ahl al-kitāb, literally »People of the Book«), protected people (ahl al-dhimma), and others.[^17] Christian bishops in canon law texts barred their parishioners from giving their daughters in marriage to outsiders (under threat of excommunication), and Jewish leaders did similarly in their responsa. Even supposing that such rules were idealistic and written to erect or reinforce boundaries that in practice were not maintainable, they reflect the thinking that each person could be assigned to one of a set of mutually exclusive legal categories corresponding to real-life communities.

With these theological and legal perspectives in the background, I find the term

­ »religious affiliation« more applicable to medieval Near Eastern biographical descriptions than ­ »religious identity«, »religious adherence«, or »religious belonging«. These latter carry with them a sense of self-identification and self-determination that would be anachronistic,

­ especially for a text such as Ibn Abī Uṣaybiʿa’s, which typically reports affiliations as observations or social perceptions rather than as first-person descriptions by the historical subjects themselves. For example, imagine a woman whose Christian parents baptized her as a child.

She then marries a Muslim man, probably by the arrangement of the families. It is unlikely that she herself will at any point determine whether others perceive her as a Christian or Muslim. Moreover, her children will be considered Muslim because of their Muslim father.

Except in the unusual case that her own statements are reported, it would be tenuous to say that she identifies as Christian or Muslim, or that she adheres to Christianity or Islam,

­ because these would imply that this determination comes through what she says about her own beliefs and practice. An »affiliation« with one of these groups, on the other hand, means only that someone (whether she herself or others) sees her as belonging to that group.

Thus, the working definition of »religious affiliation« that I would apply to Ibn Abī

­ Uṣaybiʿa’s History of Physicians is »perceived belonging to a group with ­ theological and social distinctions that are typically exclusive«.[^18] By the term »interreligious«, ­ I ­ correspondingly intend, »between differing religious affiliations«. This definition is starkly different from some modern conceptions, in which religion may be individually ­ chosen and ­ comprise highly personal and perhaps idiosyncratic elements.[^19] Significantly, this ­ definition also makes no assumptions about a person’s individual beliefs and practices (although the group as a whole is expected to hold to some theological distinctions), nor does it ­ directly relate to phenomenological descriptions (such as encountering »the numinous«).

[^17]: In general on this topic, see Levy-Rubin, _Non-Muslims in the Early Islamic Empire_; Simonsohn, _A Common Justice_; Fattal, _Le statut légal_; Freidenreich, _Christians in early and classical Sunnī law_.

[^18]: The »perception« in this case is that of the narrator (Ibn Abī Uṣaybiʿa) or that of the speaker he cites.

[^19]: For the modern concept of »religion«, see Nongbri, _Before Religion_.


<span class="badge badge-pill badge-secondary">page 252</span>

As discussed below, »perceived group belonging« fits the way Ibn Abī Uṣaybiʿa uses ­ explicit designations such as »Muslim« or »Jewish«, for example, as well as the slightly more subtle indications he gives using occupational descriptors (»qadi«, »priest«) or ­ family ­ connections.

It also fits the wide range of beliefs and practices attributed in his work to members of each group, in which a subject’s personal piety was not at issue in the ­ categorization. For ­ example, the eminent physician Yūḥannā ibn Masawayh (d. 243/857) is commonly ­ spoken of as ­ being part of the Christian community, and Ibn Abī Uṣaybiʿa quotes certain biographers that

­ explicitly call him a »Christian« and a deacon. Yet his biography in the History of ­ Physicians hardly presents a pious believer.[^20] Once while he was suffering from a deathly illness, he reportedly fumed at the monks gathered around his bed to pray for him, »One drop of rose-perfume is better that the prayers of all the people of Christendom from the ­ beginning to the day of Resurrection. Get out of my house!«21 When reproved for taking concubines, he responded to the catholicos (head of the Church of the East) with obscene insults.[^22] Yet Ibn Abī Uṣaybiʿa never suggests that Yūḥannā ibn Masawayh was not a Christian. On the other end of the spectrum of Christian piety was Abū al-Faraj ibn al-Ṭayyib (d. 435/1043).23

­ Besides being a respected physician, he was secretary to the catholicos, a practicing priest, and a Bible commentator. Ibn Abī Uṣaybiʿa calls him al-imām (translated by Savage-Smith et al. as

»paragon«). Clearly, for Ibn Abī Uṣaybiʿa, terms like »Christian« indicated the community to which someone belonged, not their beliefs and practices.

Inferring Religious Affiliation in the History of Physicians: Exploring Ibn Abī Uṣaybiʿa’s Usage With a working definition in hand, it is now time to see what terms Ibn Abī Uṣaybiʿa uses for religious affiliation in the History of Physicians and the challenges these might present for constructing a system to represent that usage. Such a system should reflect the ­ nuances, uncertainties, contradictions, and even misperceptions of religious affiliation in the text rather than flattening them. The following shows some of the ways Ibn Abī Uṣaybiʿa speaks of religious affiliation, both directly and indirectly.

1\. Explicitly religious descriptions: As explicit indications, Ibn Abī Uṣaybiʿa sometimes

­ provides a religious adjective, either attached directly to the person’s name (a nisba) or as a description of the person, such as al-Naṣrānī or al-Masīḥī (»the Christian«), al-Yahūdī (»the Jew«), or al-Isrā ̉īlī (»the Israelite«). For example, in the entry for Abū al-Barakāt ibn Shaʿyā, the author specifies that the latter was a »Karaite Jew« (wa-kāna Yahūdiyyan Qarā ̉an).24 Nisba designations for non-Muslims are common in other Islamic texts, but Ibn Abī Uṣaybiʿa employs them sparingly, even when he apparently knows the person’s affiliation and indicates it in other ways.

[^20]: Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., sec. 8.26.

[^21]: Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., sec. 8.26.7.

[^22]: Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., sec. 8.26.8.

[^23]: His biography appears in Ibn Abī Uṣaybiʿa, ʿ_ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., sec. 10.37.

[^24]: Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., sec. 14.41. This biography only appears in versions 1 and 3 (see n. 1 there). On Abū al-Barakāt, see Pines, Abu ’l-Barakāt.


<span class="badge badge-pill badge-secondary">page 253</span>

At times, Ibn Abī Uṣaybiʿa seems to mention someone’s affiliation because it relates to the person’s biography, including in cases of conversion. He says Abū al-Barakāt Hibat Allāh

­ al-Baghdādī (b. c. 470/1077, d. after 560/1164 or 1165) »was a Jew who subsequently ­ became a Muslim« (kāna Yahūdiyyan wa-aslama baʿda dhālika).25 Throughout the biography, his

­ former Jewish affiliation and his conversion feature large. The vizier al-Ṣāḥib Amīn ­ al-Dawla (d. 648/1250 or 1251) »was a Samaritan who converted to Islam under the name Kamāl al-Dīn« (kāna Sāmiriyyan wa-aslama wa-luqqiba bi-Kamāl al-Dīn).26 His uncle is given the nisba al-Sāmirī (»the Samaritan«). A final example is Amīn al-Dawla ibn al-Tilmīdh, ­ whose non-conversion is emphasized, saying he »died as a Christian« (wa-māta Naṣrāniyyan).27

­ Except in cases of conversion, Muslims are rarely designated as Muslim, an omission that is common in other Islamic texts as well.

2\. Religious offices and occupations: More frequent than explicit nisba or adjectival

­ designations are references to someone’s religious office or occupation, which clearly ­ marked their religious affiliation for Ibn Abī Uṣaybiʿa’s readers. Qadis and caliphs can be presumed Muslim, while patriarchs, metropolitans, bishops, priests, and monks can be ­ presumed Christian.[^28]

3\. Indirect indications through family relations: In other cases, the indications are ­ scattered and less direct, but may be enough to infer an affiliation when taken together. This is the case in Ibn Abī Uṣaybiʿa’s biographies of ʿAbd Allāh al-Ṭayfūrī (active late second/eighth

­ century), his son Zakariyyā, and his grandson Isrā ̉īl.[^29] None of these biographies of the

­ family’s three generations mention the affiliation of the main subjects. However, the entry for the Christian physician Yūḥannā ibn Masawayh tells about the family’s relationship to the latter.[^30] ʿAbd Allāh, it turns out, was Ibn Masawayh’s father-in-law. If ʿAbd Allāh and his

­ daughter were Muslim, it would be very unlikely for her to be given in marriage to a Christian man. The account thus implies their Christian affiliation.[^31] Moreover, ʿAbd Allāh lived next to ­ Yūḥannā in the »Christian quarter« of Baghdad and one of his sons, Dāniyal, became a monk. In the ­ biography of Ḥunayn ibn Isḥāq, ʿAbd Allāh’s grandson Isrā ̉īl is reported to have been a ­ Christian who created a conflict with Ḥunayn and then called for him to be tried by a ­ Christian tribunal.[^32] Ultimately, the catholicos got involved, suggesting that Isrā ̉īl, like

Ḥunayn, was probably affiliated with the Church of the East. On the basis of the affiliation of his descendants and (more weakly) his place of residence, it is reasonable to conclude that

ʿAbd Allāh and his mentioned descendants were Christians, likely of the East Syriac variety.

This affiliation is one that Ibn Abī Uṣaybiʿa’s readers would have easily inferred from the contextual clues he provided.

[^25]: Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., sec. 10.66.

[^26]: Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., sec. 15.49. Ibn Abī Uṣaybiʿa’s attention to this case could be due to the fact that he was the dedicatee of one version of the History of Physicians (my gratitude to Nadine Löhr for this comment on an earlier draft of this article; see Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., Preface and sec. 15.49.1).

[^27]: Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., sec. 10.64.16.

[^28]: Terms for unambiguously Jewish religious offices seem to be rare in the History of Physicians.

[^29]: Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., secs. 8.10-12.

[^30]: Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., sec. 8.26 and see above.

[^31]: Muslim men marrying Christian women was juristically and socially a different matter and was far more likely.

[^32]: Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., sec. 8.29.12 and n. 64. Ibn Abī Uṣaybiʿa reports this from Ibn Juljul, _Ṭabaqāt al-aṭibbā ̉_, ed. Fu ̉ād, 69-70 (and compare al-Qifṭī, _Ibn al-Qiftī’s Ta ̉rīh al-ḥukamā ̉_, ed. Müller and Lippert, 172).

<span class="badge badge-pill badge-secondary">page 254</span>

The following affiliations of family members are ones I have taken to be indirect indications of a subject’s own affiliation in the History of Physicians, due to prevalent legal practices and social mores:

1\. Father’s affiliation 2\. Affiliation of child (for male subjects) 3\. Non-Muslim affiliation of husband 4\. Muslim affiliation of wife 4\. Names used predominantly by particular groups: To the above indications could be added certain names, if it could be shown that their usage is nearly exclusive to a particular community. These would provide a weak signal of someone’s affiliation at birth.[^33]

Such a list can, in fact, be cautiously compiled from the Onomasticon Arabicum (OA), a digital publication of the French Centre national de la recherche scientifique (CNRS), which is based on a number of Arabic biographical dictionaries. Precisely because entries in this database sometimes record the religious affiliations mentioned by biographers, it is ­ possible to get a basic idea of which names were in use in which communities and, especially, which names were or were not used by Muslims. Each record is essentially an attestation of a

­ person’s name and other biographical information mentioned in a particular source. In the field »DIN«, OA lists any religious labels mentioned by the source or »deduced« by the person recording the data.[^34] Of about 13,500 attestation records, there were approximately 6,500 affiliation labels.[^35] By listing all of these and classifying them into »macro-affiliations« such as Muslim, Christian, Jewish, Zoroastrian, and so on, I was able to compile usage ­ statistics for each name showing the number of times it occurred for each macro-affiliation. Some important caveats are in order. Persons labeled with non-Muslim affiliations make up only a tiny proportion of the dataset (e.g., Christian: 93 records or 0.7%; Jewish: 31 records or 0.2%). Also, the vast majority of records are for men and, by virtue of being derived from biographical dictionaries, mostly prominent men.

[^33]: The idea of tracing religious affiliation through onomastic data shares some things in common with Bulliet’s well-known attempt to determine the rate of conversion to Islam in Iran using the names appearing in successive­ generations of each family (Bulliet, Conversion; for more recent evaluations of this attempt, see Harrison, Behind the curve; Bulliet, Conversion curve revisited). Given the broad scope of Ibn Abī Uṣaybiʿa’s History of Physicians with regard to time, regions, and cultures, I believe it is prudent to be particularly cautious about which names imply a Muslim affiliation and how certainly they do so.

[^34]: Given that the Onomasticon Arabicum focuses on Islamic sources and persons and that religious affiliation is not collected systematically, this resource should be used especially for attestations of names in Muslim communities and only cautiously regarding other communities. Many of the labels in the DIN field are intra-Islamic ­ references to a juristic school or a Sufi ṭarīqa (»path«). Discussion of how this field is used can be found in Müller et al., Onomasticon Arabicum. La base de données OA-online, 9, 12, 19-20; and in a history of the database in Müller, Onomasticon Arabicum: A historical survey.

[^35]: The data cited here from OA were accessed in 2017.


<span class="badge badge-pill badge-secondary">page 255</span>

Table 1: Names attested more than 100 times for Muslims in the Onomasticon Arabicum.

Name Occurrences among Muslims Muḥammad 1255 Aḥmad 585

ʿAlī* 390

ʿAbd Allāh* 240 Ibrāhīm* 189

ʿAbd al-Raḥmān 171 al-Ḥasan* 114 Ismāʿīl* 102 The three names without an asterisk – Muḥammad, Aḥmad, and ʿAbd al-Raḥmān – are ones that could be seen to have a particularly Islamic valence in contrast to, for example, ʿAbd Allāh (»slave of God«) or Ibrāhīm (Abraham), which might be seen as generally monotheistic.

Thus, I take these three names as weak indicators of a person’s Muslim affiliation at the time the name was given.

We can also see which names are not present in the nearly 6,000 attestations for Muslim men. I have classified these by Christian or Jewish usage, but it should be noted that, due to the small number of Christian and Jewish affiliations in OA, no conclusions can be drawn about which names were actually common in these communities. Moreover, of the names that occur only once in OA, I have excluded those I consider to be unusual and likely to be seen only in connection to one particular individual (e.g., Masawayh). Table 2 provides the names occurring among Christians but not Muslims.

Table 2: Names occurring among Christians but not Muslims according to attestations in the Onomasticon Arabicum.

Name Occurrences among Christians Yūḥannā/Yuḥannā 4 Bukhtīshūʿ 3 Isrā ̉īl* 2 Jibra ̉īl 2 Jūrjis/Jurjis/Jirjis 2 Mīkhā ̉īl 2 Būluṣ 1 Isṭīfan 1 Mārī 1 Masīḥ 1 Mattā 1 Nasṭās 1 Sarjis 1 Tiyādūrus/Tayādūrus 1 Yūwānīs 1


<span class="badge badge-pill badge-secondary">page 256</span>

The asterisk (*) indicates I have disregarded the name Isrā ̉īl as a particularly »Christian«

name, because I consider it likely to also occur in Jewish communities, even though it is not attested as Jewish in OA. Most of the other names could be seen as having a particularly Christian valence: names of New Testament characters or Christian saints or names that

­ refer to »Christ« (Masīḥ) or to »Jesus« in Syriac (Īshūʿ).36 Because of the small number of Jewish attestations (31), there are fewer »non-Muslim«

names attested as Jewish in OA, as seen in Table 3.37 Table 3: Names occurring among Jews but not Muslims according to attestations in the Onomasticon Arabicum.

Name Occurrences

Ḥasdāy 2

Ṣafiyya 1 Minaḥim 1 Among the onomastic data from OA and the text of the History of Physicians, there are also some surprises with regard to affiliation. Names one might have thought to have a ­ particularly Islamic valence were sometimes used also among non-Muslims, such as ʿAlī, al-Ḥasan, and

ʿAbd Allāh. Moreover, names one might guess to indicate a Jewish affiliation such as Isrā ̉īl and Hibat Allāh (the equivalent of Nathaniel) were in use among Christians, perhaps because they were also biblical names. This points to the importance of using attestation statistics to test assumptions about the religious valence connected to names.

In contrast to names, honorific titles seem of limited use as affiliation signals. Titles one might expect to be reserved for Muslims are also given to non-Muslims in Ibn Abī Uṣaybiʿa’s account. The kunya – that is, the title Abū [X] (»father of [X]«) or Umm [X] (»mother of [X]«)

– is a customary form of respect, but one prohibited by certain versions of the so-called Pact of ʿUmar, the document supposed to outline the agreements made between Muslims and conquered non-Muslim protected peoples (ahl al-dhimma).38 The provisions in the Pact of

ʿUmar were very often disregarded, and this is illustrated by the high frequency of kunya titles for non-Muslims in the History of Physicians. The presence of a kunya may in fact not indicate anything useful regarding a person’s affiliation.

[^36]: The Syriac Īshūʿ for Jesus is in contrast to the quranic name for Jesus, ʿĪsā, which was not uncommon among Muslims. If Masīḥ and Bukhtīshūʿ can be regarded as indicators of a Christian affiliation, then similar names could probably be included in this category as well: Īshūʿ, Sabrīshūʿ, and ʿAbd al-Masīḥ. A good source to

­ supplement Arabic names attested among medieval Christians would be the Syriac Biographical Dictionary (syriaca.org/persons), which has records for persons connected to the Syriac communities. The few ­ records relating to non-Christian affiliations would need to be manually excluded and the remaining names filtered ­ according to whether they have Muslim attestations in OA.

[^37]: For Jewish names, a good supplement could be the descriptions of Arabic items from the Cairo Genizah available from the Cambridge Digital Library (cudl.lib.cam.ac.uk/collections/genizah). Names would need to be extracted from the descriptions and persons known to be non-Jewish excluded. Then the list could be compared with OA and the Syriac Biographical Dictionary to determine which names are attested only for Jewish affiliations, not Muslim or Christian.

[^38]: See Ibn Ḥanbal’s version of the pact (Ibn Ḥanbal, Aḥkām ahl al-milal, ed. Khallāl and Ḥasan, 357-359) and ­ compare Levy-Rubin, _Non-Muslims in the Early Islamic Empire_, 149.


<span class="badge badge-pill badge-secondary">page 257</span>

Even more surprisingly, honorific titles with an apparent Islamic valence such as ­ al-Dawla (»of the state«) or al-Dīn (»of the religion«) are also given to non-Muslims in the History of Physicians. The Christian physician Ibn al-Tilmīdh famously bore the title Amīn al-Dawla (»trusted of the state«) along with an additional title, Muwaffaq al-Mulk (»successful of the reign«).39 Two physicians with Samaritan nisab (sg. nisba), Yūsuf ibn Abī Saʿīd and Yaʿqūb ibn Ghanā ̉im, are mentioned with the titles Muhadhdhab al-Dīn (»refined of the religion«) and Muwaffaq al-Dīn (»successful of the religion«), respectively.[^40] The Jewish physician Ibn Abī al-Bayān had the title Sadīd al-Dīn (»correct of the religion«).41 The Christian physician Yaʿqūb ibn Siqlāb and the Christian scribe Ibn al-Būrī are both given the title Muwaffaq

­ al-Dīn.[^42] Yaʿqūb ibn Isḥāq was a Jewish physician with the title Asʿad al-Dīn (»happiest of the religion«).43 The »al-Dīn« titles for non-Muslims occur especially in chapters 14-15, dealing with late Abbasid Egypt and Syria, including the Mamluk and Ayyubid periods, where Ibn Abī Uṣaybiʿa relies heavily on reports from his own networks. This might merely reflect the overall popularity of such titles in these regions and time periods, or it might have to do with the author preserving respectful forms for people connected to his circle of acquaintances.

To summarize, the indicators of religious affiliation in the present analysis of Ibn Abī

Uṣaybiʿa’s History of Physicians are as follows:

1\. Explicit statements of a subject’s affiliation or conversion 2\. Offices or occupations held by the subject that are unique to a particular affiliation 3\. Family relations a. Father’s affiliation b. Affiliation of child (for male subjects) c. Non-Muslim affiliation of husband d. Muslim affiliation of wife 4\. Names used predominantly by particular groups

[^39]: Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., sec. 10.64.

[^40]: Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., secs. 15.48, 15.59.

[^41]: Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., sec. 14.43.

[^42]: Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., sec. 15.23.2.2.

[^43]: Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., sec. 14.42.


<span class="badge badge-pill badge-secondary">page 258</span>

Inferring Religious Affiliation in the History of Physicians: Contradictory Indications Over and above the challenges of understanding Ibn Abī Uṣaybiʿa’s contextual presentation of someone’s religious affiliation is the problem of the author’s own uncertain or ­ contradictory information in certain cases.

One example is the biography of biography of Rabban al-Ṭabarī (active in the late second/ eighth and the early third/ninth centuries, father of the famous physician and convert to Islam ʿAlī ibn Rabban al-Ṭabarī, b. 165?/781?, d. after c. 241/855), which he quotes without correction from Ibn al-Qifṭī. It is asserted that Rabban al-Ṭabarī was Jewish because his title

»Rabban« sounded similar to »Rabbi«.44 This is despite the fact that Ibn Abī Uṣaybiʿa knows

»Rabban« could be a title of respect among East Syriac Christians, having recorded this in an account of Yūsuf ibn Ibrāhīm ibn al-Dāya (active in the late third/ninth cent.) regarding Jibrīl ibn Bukhtīshūʿ and Ḥunayn ibn Isḥāq.[^45] Perhaps he overlooked this inconsistency, leaning too heavily on his sources, or perhaps he preferred to let his sources speak for themselves in this case without intervening. Ibn Abī Uṣaybiʿa’s presentation of Rabban al-Ṭabarī therefore involves both a Jewish affiliation and, less directly, a Christian one.

At times, Ibn Abī Uṣaybiʿa marks his uncertainty, as in the high-profile case of ­ Maimonides (Mūsā ibn Maymūn [Arabic] or Moshe ben Maimon [Hebrew], 532-601/1138-1204):

It has been said that al-Ra ̉īs Mūsā had converted to Islam while in the Maghrib,

­ memorized the Qur’an and studied Islamic jurisprudence. Then, when he went to Egypt and took up residence in Old Cairo, he reverted to his former faith.[^46]

The author’s tentative framing (»It has been said«, wa-qīla) seems pointed, ­ especially in regard to someone closely connected to his own personal networks. The allegation that someone converted to Islam and then apostatized (irtadda) was a grave one, but in the case of Maimonides it may have been mitigated by being less than voluntary: unlike what was typical in other Islamically ruled realms, the Almohads, rulers where Maimonides had ­ s­ ojourned, left their subjects little choice.[^47] Ibn Abī Uṣaybiʿa has chosen to repeat the ­ information,

­ perhaps because it was well known and also mentioned by Ibn al-Qifṭī, but he has diluted its

­ significance as being merely a rumor.

[^44]: Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., sec. 11.3. On ʿAlī ibn Rabban al-Ṭabarī and his father, see Thomas, Al-Ṭabarī.

[^45]: Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., sec. 8.29.3. On Ibn al-Dāya, see Rosenthal, Ibn al-Dāya.

[^46]: Ibn Abī Uṣaybiʿa, _ʿUyūn al-anbā ̉_, ed. and trans. Savage-Smith et al., sec. 14.39.2 and n. 7 and see (as noted there) Ibn al-Qifṭī, _Ibn al-Qiftī’s Ta ̉rīh al-ḥukamā ̉_, ed. Müller and Lippert, 317; Stroumsa, Maimonides, 57-61. My ­ gratitude also goes to Rachel Richman for the insights shared in her unpublished paper, »The biography of Maimonides: An inquiry into the biographical and autobiographical sources« (8 December 2017; pers. comm., 26 January 2022).

[^47]: Stroumsa, Maimonides, 56-58.


<span class="badge badge-pill badge-secondary">page 259</span>

Unless Ibn Abī Uṣaybiʿa is again simply echoing his sources, he explains Maimonides’s Jewish affiliation as a »reversion« that came after the rumored conversion to Islam. It ­ appears that, for him, Maimonides could not be Muslim and Jewish simultaneously; since he was Jewish in Egypt, he must have either reverted or never converted to Islam in the first place.

The concept that religious affiliation was exclusive seems to have been generally accepted, but the case of Maimonides does raise the question of whether there might be exceptions that would allow one to infer multiple simultaneous affiliations. A historian from the region,

ʿAbd al-Wāḥid al-Marrākushī (581-625?/1185-1228?), who was a younger contemporary of Maimonides, comments:

Jews in our midst behave outwardly as Muslims: they pray in the mosques, they teach their sons the Qur ̉ān, they behave like our coreligionists and adhere to our tradition;

but God alone knows what they hide in their hearts and what they do in their houses.[^48]

Maimonides himself asserted that it was possible to live as a Jew, secretly observing the commandments, while superficially professing Islam:

If a man wishes to fulfill the 613 commandments secretly he can do so … They know very well we do not mean what we say [the shahāda], and that what we say is only to escape the ruler’s punishment and to satisfy him with this simple confession.[^49]

Maimonides and his coreligionists might not have considered themselves to be Muslim in any­ thing more than name. Yet when it is their social interactions in view rather than their secret observance of Torah, Jews who were forced to convert to Islam under the ­ Almohads could be seen to have multiple affiliations. The case of Maimonides in the History of ­ Physicians is a caution against inferring religious affiliations superficially; on a careful reading, the author’s uncertainty regarding whether Maimonides was Jewish or Muslim in the Maghrib constitutes possible indicators for two affiliations, both of which should be considered in the analysis.[^50]

Labeling Religious Affiliation Based on Multiple Signals Explicit labels, religious occupations or offices, family relationships, and a handful of ­ given names can all provide signals of a person’s affiliation with varying degrees of ­ certainty.

­ Cumulatively, such signals may help to establish that a person is being portrayed with a certain affiliation, even if individual signals (such as names or relationships) are not ­ decisive when taken in isolation. Moreover, multiple signals should be recorded even when they ­ appear contradictory, since they may indicate the author’s uncertainty or the subject’s ­ conversion or multiple affiliation.

[^48]: Translation from Stroumsa, Maimonides, 57-58. On al-Marrākushī, see Viguera Molins, ʿAbd al-Wāḥid.

[^49]: Maimonides, _Martyrdom_, sec. 4, trans. Halkin and Hartman, 30. The rest of this fascinating epistle is certainly relevant to the question of multiple affiliation but cannot be discussed here.

[^50]: In the working definition of religious affiliation in the History of Physicians given above, note that the exclusivity of groups is only »typical«, allowing for some exceptions.


<span class="badge badge-pill badge-secondary">page 260</span>

As a first trial, we used these indicators to label the affiliations of persons in the index of the recent edition and translation of the History of Physicians (LHOM).51 These index entries normally provide the person’s full name and a brief description and sometimes include the person’s occupation, affiliation, or relationships, to the extent these may be useful for identification. For example, the entry for the abovementioned al-Ṭayfūrī is: »ʿAbd Allāh al-Ṭayfūrī, Christian physician to al-Hādī«. Often, this information is drawn from the text of Ibn Abī

Uṣaybiʿa, but occasionally it is supplemented from external sources.[^52] Working with the index is thus only a preliminary way to probe what in a further stage could likely be derived from signals in the main text.

Overall, using these signals from the index entries, we were able to manually label the affiliation of approximately 660 persons out of 2,418 in the index, or about 27% (see

­ Figure 1). While this is far from the proportion needed to draw statistical conclusions or make ­ inferences from network topography, it is still far more than can be done by relying on ­ explicit identifications alone. Further, it is hoped that these signals will allow us to label many more affiliations when working directly with the text rather than with the index.

Figure 1: Total number of persons in the LHOM index whose affiliation could be labeled by any of the abovementioned signals.

[^51]: See the project report in this volume. Vanessa Birkhahn, Fabio Ioppolo, Nadine Löhr, Robin Schmahl, and Malinda Tolay (in alphabetical order) helped identify and proofread the information coming from the raw text of the index. Vanessa Birkhahn also helped to mark stated religious affiliations, and Fabio Ioppolo and Malinda Tolay processed the relationships mentioned in the index. As a rule, these entries can also be found in a draft form (with ongoing corrections) at usaybia.net.

[^52]: Although the LHOM index does not specifically cite sources, the editors indicate in the English footnotes to the corresponding biographies in the text the primary and secondary sources they used.


<span class="badge badge-pill badge-secondary">page 261</span>

As can be seen in Figure 2, the usefulness of each type of signal varies depending on the affiliation.[^53] Muslims can be identified especially by their mentioned occupations or offices, by their given names, or by their ancestors’ names. The same is largely true for Christians, but the latter are identified at a higher rate by the editors of the index, and their nisab are also helpful.[^54] Finally, Jewish affiliations prove quite difficult to find.

Figure 2: Number of persons from the LHOM index who could be labeled with Jewish, Christian, and Muslim affiliations, by signals used. The same person may be listed with more than one signal.

Constructing a Labeling System The above charts, which bracket each person in the text into a single macro-affiliation, might seem at first glance to have quantified Ibn Abī Uṣaybiʿa’s designations of religious affiliation.

In reality, they have paved over the specificity and nuance of his affiliational portrayals and, moreover, ignore the uncertainty involved in interpreting them. What is needed is to be able to record each signal’s direction, type, and certainty; that is, the specific or generic affiliation to which the indicator points, the evidence on which it is based (occupation, name, family relation, etc.), and how definite that indicator is in the author’s portrayal. Multiple signals should be allowed for each person, and each of the signals’ properties should be queryable by machine. In natural language, such a query might be expressed, or example, as »Show each person in the dataset having signals for a Jewish affiliation with a combined certainty of at least x« or »Show each person having signals for a Christian affiliation whose children have distinctively Muslim names«.

[^53]: For this chart, narrow affiliations such as »Shi’i« or »Qaraite« are grouped with broader ones (»Muslim« or

­ »Jewish«), and Samaritan and Zoroastrian affiliations (with 4 and 2 persons labeled, respectively) are omitted as having insufficient data.

[^54]: The »Labeled in Index« column shows affiliations that the editors explicitly provide in the index and may come from indications in the text or outside information.


<span class="badge badge-pill badge-secondary">page 262</span>

What this would enable is a kind of granularity that approximates the texture of Ibn Abī Uṣaybiʿa’s descriptions even when working with thousands of person records. Most notably, allowing multiple signals for each person, which can point even toward differing

­ affiliations, will highlight cases that need further investigation. One of the signals may be

­ inaccurate, conversion may have occurred (consecutive single affiliation), or it may be a case of ­ simultaneous multiple affiliation. Converts, for example, might be particularly influential in cross-communal knowledge exchange networks by transmitting knowledge from their old community to the new one (and possibly in the reverse direction), so it is important to see both of their affiliations.

For this labeling system, a kind of database should be chosen that allows recording and querying person records using the abovementioned features of religious affiliation. This has mostly to do with how the data is structured but could also be affected by limitations of the underlying database application or code. In line with our project’s adoption of TEI-XML for several other purposes – tagging person and place names in the Arabic edition of the text, creating person and place entries, and recording prosopographical factoids55 – this is also the format that we find most compatible for recording religious affiliation signals. When loaded into an XML database, the various characteristics of these signals can be retrieved and

­ processed using the XQuery language.

The example below shows one way a religious affiliation signal based on a person’s

­ occupation could be modeled using the state element in TEI, either within a person entry or incorporated into a factoid.[^56]

Figure 3: Example of a religious affiliation signal encoded as a TEI state element.

[^55]: 56 Factoids are machine-readable statements of what we understand the text to be asserting about people, relation-ships, and events. See in this volume Gibson and Schmahl, Communities of knowledge, 205.

»(state) contains a description of some status or quality attributed to a person, place, or organization often at some specific time or for a specific date range« (TEI Consortium, TEI element state). The state element was chosen over the faith element because TEI defines the latter in a way that emphasizes personal religious beliefs, contrary to the considerations mentioned in the working definition of religious affiliation above (TEI Consortium, TEI element faith). A similar structure to the one shown here could also be used to tag the indication in the text edition itself.


<span class="badge badge-pill badge-secondary">page 263</span>

The @type and @subtype attributes indicate that this is a religious affiliation signal derived from someone’s stated occupation, enabling all religious affiliation signals to be ­ selected or to filter for only those based on occupation. The @ref and @ana attributes point to terms in an external taxonomy for the community and the occupation, respectively.[^57] Since the taxonomy connects these to a hierarchy of broader and narrower terms, inferences about these terms can be made by machine, such as that the »Coptic« religious affiliation is related to the broader term »Christian«. The certainty of the person encoding the signal, that is, how definitively the encoder considers the affiliation to be indicated, can be given in the @cert attribute, either as »high«, »medium«, or »low«, or as a numeric value between 0 and 1.58 Multiple signals are recorded simply by adding another state element in the person record or adding another religious affiliation factoid. The label element shows a human-readable gloss to display for the signal, and the note element can provide more human-readable information about the inference being made. Finally, if an approximate date or date range of the affiliational signal is known, such as the date of someone’s conversion, it can be indicated in the date attributes provided by TEI (not shown here). All of this is directly connected to the relevant person, either by appearing as one or more state elements inside the person record or, in the case of a factoid, by linking to the person’s record in the database.

As mentioned above, being able to reflect the nuance and uncertainty of Ibn Abī ­ Uṣaybiʿa’s hints about affiliation also requires dealing with multiple – and sometimes conflicting –

­ indications, or »mixed signals«. In the LHOM index, there are fewer mixed signals than I ­ expected, with only two persons having conflicting »macro-affiliations«. These are Abū

Ghālib ibn Ṣafiyya al-Ṭabīb al-Naṣrānī (active late sixth/twelfth century), who is explicitly called a »Christian« but whose ancestor Ṣafiyya bears a name attested in Jewish usage in OA;

and Abū Jaʿfar Yūsuf ibn Aḥmad ibn Ḥasdāy (d. 530 or 531/1136), who seems to have hailed from the Jewish Ḥasdāy family in Andalusia, but who is said in other sources to have been a Muslim.[^59]

Named Entity Recognition Tagging a text with machine-readable labels raises the question of whether the tagging ­ itself could be automated. Fundamentally, named entity recognition (NER) is just such a process.

A digital text is passed into a process that categorizes each word using either predetermined rules or a model trained on previously tagged texts. Religious ­ affiliation in a text such as the History of Physicians could, theoretically, be tagged this way – if the model being used can process Arabic texts and recognize religious affiliation terms.

[^57]: A Taxonomy of Syriac Studies (syriaca.org/taxonomy).

[^58]: »The cert attribute provides a method of indicating the encoder’s certainty concerning an intervention or inter-pretation represented by the markup« (TEI Consortium, TEI infrastructure, sec. 1.3.1.1.4 Sources, certainty, and responsibility). Theoretically, a numeric value for the certainty of implicit signals (e.g., names) could be calibrated on the basis of explicit ones (e.g., nisab), but only once a more fully labeled dataset is available.

[^59]: See Sánchez, Ibn Ḥasdāy; Stroumsa, Between acculturation and conversion.


<span class="badge badge-pill badge-secondary">page 264</span>

At present, there are several difficulties with using NER for this task. Most ­ fundamentally, Arabic NER models do not currently include entity types for religious affiliation. This is at least partly because terms for religious affiliation are inadequately tagged, if at all, in the text corpora that have been used to train NER models. CANERCorpus is the most relevant text corpus for classical Arabic, with 258,264 words tagged from the hadith collection of

­ al-Bukhārī.60 Impressively, 20 different entity types are tagged, but there are only 210 words tagged with the types relevant for our purposes: organization (Org), sect (Sect), and religion (Rlig).61 When training their BERT-BGRU-CRF model, Norah Alsaaran and Maha ­ Alrabiah excluded these entity types as having insufficient data.[^62] The ANERcorp tagged ­ corpus of modern Arabic newspaper and Internet articles (125,102 words) generally labels the ­ explicit religious affiliation terms »Muslim«, »Christian«, and »Jewish« as either other (O) or

­ miscellaneous (Misc),63 while the AQMAR corpus of Arabic Wikipedia articles additionally labels many of these as persons (PER).64 The NER functionality in CAMeLBERT is, moreover, based on ANERcorp, and the one in the popular Stanford NLP is based on AQMAR.[^65] At base, then, to my knowledge, there exists no NER tool for tagging religious affiliation in Arabic because none have been trained on texts tagged suitably for this task. The text of Ibn Abī

Uṣaybiʿa tagged with religious affiliation signals could be used for such training.

Second, the conceptual work of defining what should be considered to indicate religious affiliation must be done prior to tagging a text and training NER models – and this is still lacking. What I have outlined above is merely a preliminary foray.

Finally, if we are to link the »religious affiliation« terms labeled by NER to stable ­ identifiers for religious entities, far more work needs to be done on structured digital ontologies and taxonomies of religious affiliation. Whereas the requirements of libraries, personographies, and gazetteers have stimulated a prolonged wrestling with the conceptual framework for identifying persons and places (and, to a lesser extent, titles and subjects), the application of religious affiliation labels in databases or digital text editions has not received the same kind of attention.

[^60]: Alsaaran and Alrabiah, Classical Arabic, 91542; Salah and Binti Zakaria, Building the Classical Arabic Named

­ Entity Recognition Corpus.

[^61]: Alsaaran and Alrabiah, Classical Arabic, 91543.

[^62]: Alsaaran and Alrabiah, Classical Arabic, 91543.

[^63]: Benajiba et al., ANERsys, 149; see also Obeid et al., CAMeL tools. I accessed the dataset from camel.­ abudhabi.nyu. edu/anercorp/ on 8 June 2023.

[^64]: Mohit et al., Recall-oriented learning, 162-163, describing the AQMAR corpus and tagger and its relation to other Arabic NER solutions; see also Alsaaran and Alrabiah, Arabic named entity recognition. I accessed the dataset from www.cs.cmu.edu/~ark/ArabicNER/ on 8 June 2023.

[^65]: Inoue et al., Interplay, 5, and Stanford NLP Group, NER models, respectively. Regarding other NER services: Microsoft’s Azure services explicitly states that it does not include nationality or religion in the »Organization« category (which is included for Arabic language) and does not appear to include it elsewhere (jboback et al., Entity categories). The popular spaCy toolkit does not list any official Arabic models, but some work appears to have been done in the »ar« folder of the GitHub repository (ExplosionAI GmbH, Models & languages).


<span class="badge badge-pill badge-secondary">page 265</span>

Conclusions and Application When it comes to coding religious affiliation in Ibn Abī Uṣaybiʿa’s History of Physicians, the next step would be to manually label signals of religious affiliation throughout the text of chapters 8-15 and connect these to the people already identified and tagged.[^66] Something similar to the example of the state element given above could be applied inline as a tag where such signals occur in the text, or as »standoff markup« in the form of a TEI factoid linking to the text passage. While some of the labeling can probably be done by searching for keywords (explicit designations, occupations, and names, as mentioned above), it will undoubtedly need thorough human review, and connecting these tagged signals to the people they refer to is most likely a manual task.

Comprehensively tagged religious affiliation signals will add a crucial analytic dimension to our analysis of the networks Ibn Abī Uṣaybiʿa depicts in his text, which contain thousands of persons with perhaps tens of thousands of relationships between them. It will then be

­ possible to see which persons »bridge« various religious communities or »clusters«, and to do so while taking into account the certainty and specificity of the signals. With this

­ information in hand, anecdotal impressions can be compared to wider patterns. For example, are Ibn Abī Uṣaybiʿa’s own networks more interreligious than those he reports from other sources? An answer to this question would help test Thomas Carlson’s thesis that medicine in the seventh/thirteenth century was less dominated by Muslim practitioners than previously suggested.[^67] Or, as another example, among the various roles our author portrays (physician, patient, patron/employer, commentator, etc.), how is religious affiliation distributed?

Religious affiliations labeled in Ibn Abī Uṣaybiʿa’s text with the detailed attributes mentioned above could serve as training material for Arabic NER models, making it possible to tag religious affiliations in the voluminous pages of other medieval Arabic biographical works. While adjustments would need to be made for the idiosyncrasies of particular ­ corpora, computer tagging of religious affiliations is a conceivable goal. So far, NER tools for Arabic do not label religion-related terms. The tagged text of Ibn Abī Uṣaybiʿa could serve as ground truth, specifically as labeled training data, to train an algorithm using supervised or semi-supervised learning methods. That is, using a text tagged for religious affiliation signals in the ways described here, someone wanting to tag another text (or corpus) for religious ­ affiliation could automate the process and further refine its accuracy. Such an algorithm should be trained to label religious affiliation with the type of signal, its corresponding ­ certainty, and its referent (the specific or more general community to which it refers).

[^66]: 67 Although general considerations for this work were discussed above, more specific guidelines for encoders need to be developed to ensure that this can be done consistently across the text. Carlson, Garden of the reasonable.


<span class="badge badge-pill badge-secondary">page 266</span>

Our understanding of interreligious exchanges in the medieval Near East has so far been hindered not only by vague definitions of religious affiliation and confusing disparities

­ between medieval and modern concepts, but also by the lack of large-scale, systematically tagged data. Further study of the relationships between religious communities should have a broader textual basis, one assisted by automated tagging and analysis, but one that does not flatten religion into a single macro-affiliation attribute for each of the persons mentioned in these texts. As seen in Ibn Abī Uṣaybiʿa’s History of Physicians, affiliation can be broad or narrow, single or multiple, and based on evidence that is more or less definitive. Thus, the approach described here, applied at first manually, can serve as the starting point of larger-scale, machine-assisted analyses of interreligious relations.

Acknowledgments This article is based, in part, on the author’s presentation by the same title on 11 December 2020 in the virtual forum »Jews, Christians, and Muslims as Colleagues and Collaborators in the Abbasid Near East« (20 October-11 December 2020, Munich/online). I would like to extend my gratitude to the respondent, Rémy Gareil, and to the other participants who com-mented on the paper. My thanks also go to Nadine Löhr for her comments on an earlier draft of this article, and to the members of the Sozietät für Religionswissenschaft at the Goethe University Frankfurt for their insights on 23 May 2023, especially Gero Menzel. Any

­ r­ emaining errors are my own.

The project »Wissensgemeinschaften: Interreligiöse Gelehrtennetzwerke in Ibn Abi

­ Usaybiʿa’s Geschichte der Ärzte« (grant number 01UL1826X) was funded 2018-2022 by the German Federal Ministry of Education and Research (BMBF) in the program »Kleine Fächer –

Große Potentiale«. Further work on related topics, partly mentioned here, was funded by the BMBF (2022-2023) for the subproject »Arabic Literary Personages as Jewish ­ Documentary Subjects« in the larger project »Beyond Conflict and Coexistence: Entangled Histories of Jewish-Arab Relations«.


<span class="badge badge-pill badge-secondary">page 267</span>

References Abū Qurra, Thāwdhūrus, _Traité de l’existence du créateur et de la vraie religion_, ed. Ignace Dick, Patrimoine arabe chrétien 3 (Rome, 1982).

Accad, Martin, The Gospels in the Muslim discourse of the ninth to the fourteenth centuries:

An exegetical inventorial table, _Islam and Christian–Muslim Relations_ 14/1-4 (2003) 67-91, 205-220, 337-352, 459-479, doi.org/10.1080/09596410305270.

Alsaaran, Norah and Maha Alrabiah, Arabic named entity recognition: A BERT-BGRU

­ approach, _Computers, Materials & Continua_ 68 (2021) 471-485.

Alsaaran, Norah and Maha Alrabiah, Classical Arabic named entity recognition using

­ variant deep neural network architectures and BERT, _IEEE Access_ 9 (2021) 91537-91547, doi.org/10.1109/ACCESS.2021.3092261.

Benajiba, Yassine, Paolo Rosso, and José Miguel Benedí Ruiz, ANERsys: An Arabic named entity recognition system based on maximum entropy, in: Alexander Gelbukh (ed.),

­ Computational Linguistics and Intelligent Text Processing, Lecture Notes in Computer

­ Science (Berlin, 2007) 143-153, doi.org/10.1007/978-3-540-70939-8_13.

Berger, Peter L., Some second thoughts on substantive versus functional definitions of religion, _Journal for the Scientific Study of Religion_ 13/2 (1974) 125-133, doi.org/10.2307/1384374.

Bruce, Steve, Defining religion: A practical response, _International Review of Sociology_ 21/1 (March 2011) 107-120, doi.org/10.1080/03906701.2011.544190.

Bulliet, Richard W., Conversion to Islam in the Medieval Period: An Essay in Quantitative

­ History (Cambridge, MA, 1979).

Bulliet, Richard W., The conversion curve revisited, in: A.C.S. Peacock (ed.),

­ Islamisation: Comparative Perspectives from History (Edinburgh, 2017) 69-82, doi.

org/10.1515/9781474417136-007.

Carlson, Thomas A., »The garden of the reasonable«: Religious diversity among Middle

­ Eastern physicians, AD 1000-1500, _Journal of Near Eastern Studies_ 81/1 (April 2022) 99-118, doi.org/10.1086/718476.

ExplosionAI GmbH, Models & languages: SpaCy usage documentation, spaCy (2016-2023).

Accessed on 27 June 2023: spacy.io/usage/models.

Fattal, Antoine, __Le statut légal_ des non-musulmans en pays d’Islam_, Recherches publiées sous la direction de l’Institut de lettres orientales de Beyrouth 10 ([Beirut], 1958).

Freidenreich, David M., _Christians in early and classical Sunnī law_, in: David Thomas and Barbara Roggema (eds.), _Christian-Muslim Relations: A Bibliographical History: Volume 1 (600-900)_, History of Christian-Muslim Relations 11 (Leiden, 2009) 99-114.

Freidenreich, David M., The use of Islamic sources in Saadiah Gaon’s Tafsīr of the Torah,

­ Jewish Quarterly Review 93 (2003) 353-395.

Gibson, Nathan P., Knowledge collaboration among Jews, Christians, Zoroastrians, and

­ Muslims in the Abbasid Near East: Introduction, _Medieval Worlds_ 17 (2022) 59-72, doi.

org/10.1553/medievalworlds_no17_2022s59.

Harrison, Alwyn, Behind the curve: Bulliet and conversion to Islam in al-Andalus revisited, _Al-Masāq_ 24/1 (April 2012) 35-51, doi.org/10.1080/09503110.2012.655582.


<span class="badge badge-pill badge-secondary">page 268</span>

Ibn Abī Uṣaybiʿa, Muwaffaq al-Dīn Abū l-ʿAbbās Aḥmad b. al-Qāsim b. Khalīfa, ʿUyūn al-anbā

̉ fī _ṭabaqāt al-aṭibbā ̉_, ed. and trans. Emilie Savage-Smith, Simon Swain, and Geert Jan van Gelder, _A Literary History of Medicine: The ʿUyūn al-anbā ̉ fī _ṭabaqāt al-aṭibbā ̉_ of Ibn Abī ­ Uṣaybiʿah_, 5 vols., Handbook of Oriental Studies, Section 1: The Near and Middle East 134 (Leiden, 2019), scholarlyeditions.brill.com/library/urn:cts:arabicLit:

0668IbnAbiUsaibia Ibn al-Qifṭī, ʿAlī ibn Yūsuf, _Ibn al-Qiftī’s Ta ̉rīh al-ḥukamā ̉_, ed. August Müller and Julius

­ Lippert (Leipzig, 1903) doi.org/10.25673/100277.

Ibn Ḥanbal, Aḥmad ibn Muḥammad, Aḥkām ahl al-milal min al-jāmiʿ li-masā ̉il al-Imām ­ Aḥmad ibn Ḥanbal, ed. Aḥmad ibn Muḥammad Khallāl and Kisrawī Ḥasan (Beirut, 1994).

Ibn Juljul, Sulaymān ibn Ḥassān, _Ṭabaqāt al-aṭibbā ̉_ wa-al-ḥukamā ̉, ed. Sayyid Fu ̉ād (Beirut, 1985).

Inoue, Go, Bashar Alhafni, Nurpeiis Baimukan, Houda Bouamor, and Nizar Habash, The ­ interplay of variant, size, and task type in Arabic pre-trained language models (4 ­ September 2021) arxiv.org/abs/2103.06678.

jboback, aahill, and nitinme [=Nitin Mehrotra], Entity categories recognized by Named­ Entity Recognition in Azure Cognitive Service for Language, Azure Cognitive Services (31 ­ October 2022) learn.microsoft.com/en-us/azure/cognitive-services/language-service/named-entity-recognition/concepts/named-entity-categories.

Könemann, Judith, Religion, Das wissenschaftlich-religionspädagogische Lexikon im Internet (WiReLex), 2016 Jahrgang (2015) www.bibelwissenschaft.de/stichwort/100075/.

Levy-Rubin, Milka, _Non-Muslims in the Early Islamic Empire_: From Surrender to Coexistence, Cambridge Studies in Islamic Civilization (New York, 2011).

Maimonides, Moses, Epistle on martyrdom, trans. Abraham S. Halkin and David Hartman, Epistles of Maimonides: Crisis and Leadership (Philadelphia, 1993) 13-45.

Mohit, Behrang, Nathan Schneider, Rishav Bhowmick, Kemal Oflazer, and Noah A. Smith, Recall-oriented learning of named entities in Arabic Wikipedia, in: Walter Daelemans (ed.), Proceedings of the 13th Conference of the European Chapter of the Association for

­ Computational Linguistics (Stroudsburg, PA, 2012) 162-173.

Müller, Christian, Onomasticon Arabicum: A historical survey (2014). Accessed on 10 March 2023: onomasticon.irht.cnrs.fr/bundles/irhtoafront/pdf/The_Project.pdf.

Müller, Christian, Muriel Roiland, and Jacqueline Sublet, Onomasticon Arabicum. La base de données OA-online (OA3-version 2018) (2018). Accessed on 10 March 2023: ­ onomasticon.

irht.cnrs.fr/bundles/irhtoafront/pdf/OA3_method_arab_onomastics2018.pdf.

Nagel, T., Ḳiṣaṣ al-Anbiyā ̉, in: Peri Bearman, Thierry Bianquis, Clifford E. Bosworth, Emeri van Donzel, and Wolfhart P. Heinrichs (eds.), _Encyclopaedia of Islam, Second Edition_­ (Leiden, 2012). Accessed on 4 April 2023: doi.org/10.1163/1573-3912_islam_SIM_4401.

Nongbri, Brent, _Before Religion_: A History of a Modern Concept (New Haven, NJ, 2013).

Obeid, Ossama, Nasser Zalmout, Salam Khalifa, Dima Taji, Mai Oudah, Bashar Alhafni, Go

­ Inoue, Fadhl Eryani, Alexander Erdmann, and Nizar Habash, CAMeL tools: An open source python toolkit for Arabic natural language processing, Proceedings of the Twelfth Language Resources and Evaluation Conference (Marseille, France, 2020) 7022-7032. ­ Accessed on 27 June 2023: aclanthology.org/2020.lrec-1.868.

Pines, S., Abu ’l-Barakāt, in: Peri Bearman, Thierry Bianquis, Clifford E. Bosworth, Emeri van Donzel, and Wolfhart P. Heinrichs (eds.), _Encyclopaedia of Islam, Second Edition_ ­ (Leiden, 2012). Accessed on 26 June 2023: doi.org/10.1163/1573-3912_islam_SIM_0167.


<span class="badge badge-pill badge-secondary">page 269</span>

Rosenthal, F., Ibn al-Dāya, in: Peri Bearman, Thierry Bianquis, Clifford E. Bosworth, Emeri van Donzel, and Wolfhart P. Heinrichs (eds.), _Encyclopaedia of Islam, Second Edition_ (­ Leiden, 2012). Accessed on 4 April 2023: doi.org/10.1163/1573-3912_islam_SIM_3126.

Rustow, Marina, The legal status of ḏimmī-s in the Fatimid East: A view from the ­ palace in ­ Cairo, in: Maribel Fierro and John Tolan (eds.), _The Legal Status of ­ Ḍimmī-s in the Islamic West (Second/Eighth–Ninth/Fifteenth Centuries)_, Religion and Law in Medieval­ Christian and Muslim Societies 1 (Turnhout, 2013) 307-332, doi.org/10.1484/ M. RELMIN-EB.1.101823.

Salah, Ramzi Esmail, and Lailatul Qadri Binti Zakaria, Building the Classical Arabic Named Entity Recognition Corpus (CANERCorpus), 2018 Fourth International Conference on

­ Information Retrieval and Knowledge Management (CAMP) (Kota Kinabalu, Malaysia, 2018) 1-8, doi.org/10.1109/INFRKM.2018.8464820.

Sánchez, Ignacio, Ibn Ḥasdāy, Abū Jaʿfar, in: Kate Fleet, Gudrun Krämer, Denis Matringe, John Nawas, and Devin J. Stewart (eds.), _Encyclopaedia of Islam, THREE_ (Leiden, 2018) doi.org/10.1163/1573-3912_ei3_COM_32138.

Silverman, David, Harvey Sacks: Social Science and Conversation Analysis (Oxford, 1998).

Simonsohn, Uriel I., _A Common Justice_: The Legal Allegiances of Christians and Jews Under Early Islam, Divinations: Rereading Late Ancient Religion (Philadelphia, PA, 2011).

Stanford NLP Group, NER models, _Stanza_ (2020). Accessed on 27 June 2023: ­ stanfordnlp.

github.io/stanza/ner_models.html.

Stroumsa, Sarah, Between acculturation and conversion in Islamic Spain: The case of the Banū Ḥasday, _Mediterranea: International Journal on the Transfer of Knowledge_ (March 2016) 9-36, doi.org/10.21071/mijtk.v0i1.5171.

Stroumsa, Sarah, _Maimonides in His World: Portrait of a Mediterranean Thinker_, Jews,­ Christians, and Muslims from the Ancient to the Modern World 34 (Princeton, 2009) doi.org/10.1515/9781400831326.

TEI Consortium, TEI element faith, P5: Guidelines for Electronic Text Encoding and ­ Interchange, version 4.6.0, revision f18deffba (updated 4 April 2023) www.tei-c.org/release/doc­ / tei-p5-doc/en/html/ref-faith.html.

TEI Consortium, TEI element state, P5: Guidelines for Electronic Text Encoding and ­ Interchange, version 4.5.0, revision 3e98e619e (updated 25 October 2022) tei-c.org/release/doc/­ tei-p5-doc/en/html/ref-state.html.

TEI Consortium, The TEI Infrastructure, P5: Guidelines for Electronic Text Encoding and

­ Interchange, version 4.6.0, revision f18deffba (updated 4 April 2023) ­ www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html.

Thomas, David, Al-Ṭabarī, in: Peri Bearman, Thierry Bianquis, Clifford E. Bosworth, Emeri van Donzel, Wolfhart P. Heinrichs (eds.), _Encyclopaedia of Islam, Second Edition_ (Leiden, 2012) doi.org/10.1163/1573-3912_islam_SIM_7248.

Thomas, David, _Christian Doctrines_ in Islamic Theology, The History of Christian-Muslim­ Relations 10 (Leiden, 2008).

Thomas, David and Alexander Mallett (eds.), _Christian-Muslim Relations: A Bibliographical History, Volume 3 (1050-1200)_ (Leiden, 2009).

Thomas, David and Barbara Roggema (eds.), _Christian-Muslim Relations: A Bibliographical History, Volume 1 (600-900)_ (Leiden, 2009).

Thomas, David, Barbara Roggema, and Juan Pedro Monferrer Sala (eds.), _Christian-Muslim Relations: A Bibliographical History, Volume 2 (900-1050)_ (Leiden, 2009).

Tillier, Mathieu (ed.), Le pluralisme judiciaire dans l’Islam prémoderne, special issue, _Bulletin d’Études Orientales_ 63 (2014) www.jstor.org/stable/i40179881.


<span class="badge badge-pill badge-secondary">page 270</span>

Vernet, J., Ibn Abī Uṣaybiʿa, in: Peri Bearman, Thierry Bianquis, Clifford E. Bosworth, Emeri van Donzel, and Wolfhart P. Heinrichs (eds.), _Encyclopaedia of Islam, Second Edition_ (2012) doi.org/10.1163/1573-3912_islam_SIM_3058.

Viguera Molins, María Jésus, ʿAbd al-Wāḥid al-Marrākushī, in: Kate Fleet, Gudrun Krämer, John Nawas, and Devin J. Stewart (eds.), _Encyclopaedia of Islam, THREE_ (Leiden, 2009), doi.org/10.1163/1573-3912_ei3_COM_22596.

Weitz, Lev E., _Between Christ and Caliph_: Law, Marriage, and Christian Community in Early Islam, Divinations (Philadelphia, PA, 2018).

Weltecke, Dorothea, Über Religion vor der »Religion«: Konzeptionen vor der Entstehung des neuzeitlichen Begriffes, in: Rudolf Schlögl, Thomas G. Kirsch, and Dorothea Weltecke (eds.), _Religion als Prozess_ (Paderborn, 2015) 13-34, doi.org/10.30965/9783657781164_004.

Websites Cambridge Digital Library Genizah Collection: cudl.lib.cam.ac.uk/collections/genizah Computational Approaches to Modeling Language Lab (NYU Abu Dhabi):

nyuad.nyu.edu/en/research/faculty-labs-and-projects/computational-approaches-to-modeling-language-lab/resources.html Syriac Biographical Dictionary: syriaca.org/persons A Taxonomy of Syriac Studies: syriaca.org/taxonomy TEI Guidelines: www.tei-c.org/release/doc/tei-p5-doc/en/html/index.html List of Figures Figure 1: Total number of persons in the LHOM index whose affiliation could be labeled by any of the above-mentioned signals.

Figure 2: Number of persons from the LHOM index who could be labeled with Jewish,

­ Christian, and Muslim affiliations, by signals used. The same person may be listed with more than one signal.

Figure 3: Example of a religious affiliation signal encoded as a TEI state element.

Table 1: Names attested more than 100 times for Muslims in the Onomasticon Arabicum.

Table 2: Names occurring among Christians but not Muslims according to attestations in the Onomasticon Arabicum.

Table 3: Names occurring among Jews but not Muslims according to attestations in the

­ Onomasticon Arabicum.

medieval worlds • No. 18 • 2023 • 246-270
