import panflute as pf


def prepare(doc):
    doc.latest_question=1


def action(elem, doc):
    if isinstance(elem, pf.Div) and "Exercise" in elem.classes:
        question = elem
        parent = question.parent
        header = pf.Div(pf.Para(pf.Str("Exercise {0}".format(doc.latest_question))))
        doc.latest_question += 1
        parent.content[question.index] = header
        header.classes.append("ENumber")
        header.content.append(question)
        return header

def finalize(doc):
    pass


def main(doc=None):
    return pf.run_filter(action,
                         prepare=prepare,
                         finalize=finalize,
                         doc=doc) 

if __name__ == '__main__':
    main()