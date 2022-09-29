import re
import os

# st = '.param v1 = 3 r1 = 40k'
#
# pr1 = 'v1'
# rp1 = 5
# pr2 = 'r1'
# rp2 = 30

# m = re.search(pr1 + '\\ *=\\ *\\w', st)
# ra = m.span()
# # print('m = ', m)
# # print('ra = ', ra)

# rep = ng.paramRepl(pr1, rp1, st)
# print('rep = ', rep)
# print(type(pr1) == str)


# Replace a parameter with a given replacement number or string
def paramRepl(par, rep, st):
    if type(rep) == str:
        return re.sub(par + '\\ *=\\ *\\w*.+\\w+', par + ' = ' + rep, st)
    else:
        return re.sub(par + '\\ *=\\ *\\w*.+\\w+', par + ' = ' + str(rep), st)


# Run a ngSpice simulation with the fname.sp file
def ngRun(fname):
    cmd = 'ngspice -a -b -i ' + fname + '.sp' ' -o ' + fname + '.lis -r ' + fname + '.raw >> temp'
    return os.system(cmd)


# Clean .lis, .raw and .png files from directory
def ngClean(temp=False):
    if temp:
        os.system('rm temp.sp')
        os.system('rm temp.lis')
        os.system('rm temp.raw')
    else:
        os.system('rm *.lis')
        os.system('rm *.raw')
        os.system('rm *.png')


# Import ngSpice output to object
class ngsOut:
    def __init__(self, fname):
        self.spiceName = fname
        self.title = ''
        self.simType = ''
        self._nVars = 0
        self._nPoints = 0
        self.lVars = []
        self.vals = {}

    def __str__(self):
        st = '{File: ' + self.spiceName + '.sp, '
        st = st + 'Title: ' + self.title + ', '
        st = st + 'Type: ' + self.simType + ', '
        st = st + 'Vars: ' + str(self.lVars) + ', '
        st = st + 'No. Points: ' + str(self.nPoints) + '}'
        return st

    @property
    def nVars(self):
        return self._nVars

    @property
    def nPoints(self):
        return self._nPoints

    @nVars.setter
    def nVars(self, v):
        self._nVars = v
        self.lVars = ['' for i in range(v)]

    @nPoints.setter
    def nPoints(self, v):
        self._nPoints = v

    def initVals(self):
        for q in self.lVars:
            self.vals[q] = [0.0 for i in range(self.nPoints)]

    def loadData(self):
        with open(self.spiceName + '.raw', 'r') as so:
            spiceOut = so.readlines()
        varFlag = False
        valFlag = False
        vari = 0
        vali = 0
        for line in spiceOut:
            if line.startswith('Title'):
                self.title = re.sub('Title' + '\\ *:\\ *', '', line).replace('\n', '')
            elif line.startswith('Plotname'):
                self.simType = re.sub('Plotname' + '\\ *:\\ *', '', line).replace('\n', '')
            elif line.startswith('No. Variables'):
                self.nVars = int(re.sub('No. Variables' + '\\ *:\\ *', '', line))
            elif line.startswith('No. Points'):
                self.nPoints = int(re.sub('No. Points' + '\\ *:\\ *', '', line))
            elif line.startswith('Variables'):
                varFlag = True
            elif varFlag:
                self.lVars[vari] = line.split()[1]
                vari += 1
                if vari >= self.nVars:
                    varFlag = False
                    vari = 0
                    self.initVals()
            elif line.startswith('Values'):
                valFlag = True
            elif valFlag:
                if vari == 0:
                    self.vals[self.lVars[vari]][vali] = float(line.split()[1])
                else:
                    self.vals[self.lVars[vari]][vali] = float(line)
                vari += 1
                if vari > (self.nVars - 1):
                    vari = 0
                    vali += 1
            else:
                pass
