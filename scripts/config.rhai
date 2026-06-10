let titles_type = ["Dataset", "Survey", "Review", "Overview", "Benchmark"];
let titles_model = [
    "Hierarchical Navigable Small World", "HNSW", "DiskANN", "ScaNN", "FAISS",
    "Vector Databases", "Vector Database", "Vector Index", "Vector Search",
    "VQ-VAE", "\\bIVF\\b", "\\bPQ\\b", "\\bOPQ\\b"
];
let titles_method = [
    "Approximate Nearest Neighbor Search", "Approximate Nearest Neighbors",
    "Approximate Nearest Neighbor", "Nearest Neighbor Search",
    "Nearest Neighbors", "Nearest Neighbor", "Similarity Search",
    "Maximum Inner Product Search", "Embedding Search", "Dense Retrieval",
    "Retrieval-Augmented Generation", "Vector Quantization", "Product Quantization",
    "Residual Quantization", "Scalar Quantization", "Quantization",
    "Vector Compression", "Quantized", "Quantizer", "\\bMIPS\\b",
    "\\bANNS\\b", "\\bANN\\b", "\\bk[- ]?NN\\b", "\\bRAG\\b"
];
let titles = titles_model + titles_method + titles_type;
let authors_array = [
    // General ML anchors kept from the original config.
    "Yann LeCun", "Geoffrey Hinton", "Yoshua Bengio",

    // Vector DB / ANNS systems, benchmarks, and quantization authors.
    "James Jie Pan", "Jianguo Wang", "Guoliang Li",
    "Rentong Guo", "Xiaofan Luan", "Long Xiang", "Xiao Yan", "Xiaomeng Yi",
    "Jigao Luo", "Qianya Cheng", "Jiarui Luo", "Zhenshan Cao", "Yanliang Qiao",
    "Weizhi Xu", "Mengzhao Wang", "Yunjun Gao", "Zhangyang Peng", "Charles Xie",
    "Suhas Jayaram Subramanya", "Rohan Kadekodi", "Ravishankar Krishnaswamy",
    "Harsha Vardhan Simhadri", "Aditi Singh", "Qi Chen", "Bing Zhao",
    "Haidong Wang", "Mingqin Li", "Chuanjie Liu", "Zengzhong Li", "Mao Yang",
    "Jingdong Wang", "Matthijs Douze", "Alexandr Guzhva", "Chengqi Deng",
    "Jeff Johnson", "Gergely Szilvasy", "Pierre-Emmanuel Mazaré", "Pierre-Emmanuel Mazare",
    "Maria Lomeli", "Lucas Hosseini", "Hervé Jégou", "Herve Jegou",
    "Yury Malkov", "Yu. A. Malkov", "Dmitry Yashunin", "D. A. Yashunin",
    "George Williams", "Martin Aumüller", "Martin Aumueller", "Artem Babenko",
    "Dmitry Baranchuk", "Amir Ingber", "Ruiqi Guo", "Sanjiv Kumar", "David Simcha",
    "Liana Patel", "Peter Kraft", "Carlos Guestrin", "Matei Zaharia",
    "Jianyang Gao", "Cheng Long", "Raymond Chi-Wing Wong", "Hiroyuki Ootomo",
    "Akira Naruse", "Corey Nolet", "Tamas Feher", "Tamás Béla Fehér",
    "Laxman Dhulipala", "Rajesh Jayaram", "Jakub Lacki", "Jakub Łącki",
    "Prashant Pandey", "Maciej Besta", "Torsten Hoefler"
];

let focus_venues = [
    // Database / IR / data mining focus venues and common journal name variants.
    "Proceedings of the ACM on Management of Data", "PACMMOD", "SIGMOD",
    "Proceedings of the VLDB Endowment", "The VLDB Journal", "VLDB Journal",
    "Very Large Data Bases", "PVLDB", "VLDBJ", "VLDB",
    "IEEE International Conference on Data Engineering", "ICDE",
    "SIGIR", "Knowledge Discovery and Data Mining", "KDD",
    "ACM Transactions on Database Systems", "Transactions on Database Systems", "TODS",
    "ACM Transactions on Information Systems", "Transactions on Information Systems", "TOIS",
    "IEEE Transactions on Knowledge and Data Engineering",
    "Transactions on Knowledge and Data Engineering", "TKDE"
];

let conferences = focus_venues + [
    // AI
    "AAAI", "AAMAS", "ACM MM", "AISTATS", "ALT", "CEC", "ECAI", "FUZZ IEEE", "GECCO", "ICANN", "ICAPS", "ICCBR", "ICONIP", "ICRA", "ICTAI", "IJCAI", "IJCNN", "IROS", "KR", "KSEM", "SIGGRAPH", "STOC", "UAI", "PPSN", "PRICAI", "TAAI",
    // CV
    "3DV", "ACCV", "ACM MM", "BMVC", "CVPR", "ECCV", "ICCV", "ICDAR", "ICIP", "ICME", "ICPR", "IEEE VIS", "MICCAI", "SIGGRAPH", "WACV",
    // DM
    "AKBC", "APWeb", "CIKM", "DASFAA", "ECML-PKDD", "ICDE", "ICDM", "ICDT", "KDD", "LREC", "MDM", "PAKDD", "PODS", "RecSys", "SDM", "SIGMOD", "VLDB", "WSDM", "WWW", "EDBT", "CIDR",
    // IR
    "ECIR", "ESWC", "ICMR", "ICTIR", "ISWC", "SIGIR",
    // ML
    "ACML", "AISTATS", "ECML", "ICLR", "ICML", "ML4H", "NeurIPS", "NIPS", "UAI",
    // NLP
    "AACL", "ACL", "CCL", "COLING", "COLT", "CoNLL", "EACL", "EMNLP", "ICASSP", "ICDAR", "ICONIP", "INTERSPEECH", "LREC", "NAACL", "NLPCC", "RepL4NLP", "SIGDIAL", "SemEval", "WANLP", "WASSA", "WOAH",
    // Arch
    "ASPLOS", "ATC", "DATE", "EuroSys", "FAST", "HPCA", "ISCA", "MICRO", "PPoPP", "SC", "SoCC",
    // System
    "FSE/ESEC", "ICSE", "ISSTA", "OSDI", "SOSP",
    // Security
    "ACSA", "AsiaCCS", "CCS", "DSN", "ESORICS", "EuroS&P", "ICICS", "NDSS", "RAID", "SP", "USENIX Security"
];

let start = conferences.shift();
let conferences_rg = conferences.reduce(|sum, v| sum + "|" + v, start);
let conferences_rg = "(" + conferences_rg + ")([\\s'-]*\\d+)?";

let start = titles.shift();
let title_rg = titles.reduce(|sum, v| sum + "|" + v, start);

let start = authors_array.shift();
let authors_rg = authors_array.reduce(|sum, v| sum + "|" + v, start);

export title_rg;
export authors_rg;
export conferences_rg;