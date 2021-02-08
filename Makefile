SRCS=_idiv32by16r16.s  decsp5.s         lgt.s       pushaff.s\
_imul16x16r32.s   decsp6.s         linc.s      pushax.s\
_imul8x8r16.s     decsp7.s         lle.s       pushb.s\
_swap.s           decsp8.s         llt.s       pushbsp.s\
_udiv32by16r16.s  div.s            lmod.s      pushc0.s\
_umul16x16r32.s   divt.s           lmul.s      pushc1.s\
_umul16x8r32.s    enter.s          lne.s       pushc2.s\
_umul8x8r16.s     eq.s             lneg.s      pushlysp.s\
add.s             ge.s             lor.s       pushw.s\
addeqsp.s         gt.s             lpop.s      pushwsp.s\
addysp.s          icmp.s           lpush.s     regswap.s\
along.s           idiv32by16r16.s  lrsub.s     regswap1.s\
and.s             imul16x16r32.s   lsave.s     regswap2.s\
aslax1.s          imul8x8r16.s     lshelp.s    return0.s\
aslax2.s          incax1.s         lshl.s      return1.s\
aslax3.s          incax2.s         lshr.s      rsub.s\
aslax4.s          incax3.s         lsub.s      shelp.s\
asleax1.s         incax5.s         lsubeq.s    shl.s\
asleax2.s         incax6.s         lsubeqsp.s  shr.s\
asleax3.s         incax7.s         lt.s        shrax1.s\
asleax4.s         incax8.s         ltest.s     shrax2.s\
asr.s             incaxy.s         ludiv.s     shrax3.s\
asrax1.s          incsp1.s         luge.s      shrax4.s\
asrax2.s          incsp2.s         lugt.s      shreax1.s\
asrax3.s          incsp3.s         lule.s      shreax2.s\
asrax4.s          incsp4.s         lult.s      shreax3.s\
asreax1.s         incsp5.s         lumod.s     shreax4.s\
asreax2.s         incsp6.s         lxor.s      staspidx.s\
asreax3.s         incsp7.s         makebool.s  staxsp.s\
asreax4.s         incsp8.s         mod.s       staxspi.s\
axlong.s          jmpvec.s         mul.s       steaxsp.s\
bneg.s            ladd.s           mul20.s     steaxspi.s\
bpushbsp.s        laddeq.s         mul40.s     stkchk.s\
call.s            laddeqsp.s       mul8.s      sub.s\
callirq.s         land.s           mulax10.s   subeqsp.s\
callmain.s        lasr.s           mulax3.s    subysp.s\
callptr4.s        lbneg.s          mulax5.s    swap.s\
compl.s           lcmp.s           mulax6.s    tosint.s\
condes.s          lcompl.s         mulax7.s    toslong.s\
copydata.s        ldai.s           mulax9.s    udiv.s\
crt0.s            ldau0sp.s        ne.s        udiv32by16r16.s\
decax1.s          ldaui.s          negabs.s    uge.s\
decax2.s          ldauisp.s        or.s        ugt.s\
decax3.s          ldaxi.s          popa.s      ule.s\
decax4.s          ldaxsp.s         popptr1.s   ult.s\
decax5.s          ldeaxi.s         popsreg.s   umod.s\
decax6.s          ldeaxysp.s       push1.s     umul16x16r32.s\
decax7.s          ldec.s           push2.s     umul8x16r24.s\
decax8.s          ldiv.s           push3.s     umul8x8r16.s\
decaxy.s          le.s             push4.s     xor.s\
decsp1.s          leaaxsp.s        push5.s     zerobss.s\
decsp2.s          leave.s          push6.s     zeropage.s\
decsp3.s          leq.s            push7.s\
decsp4.s          lge.s            pusha.s

BIN= smallnes.lib

BUILD_DIR= ./build
SRC_DIR = ./src

$(BIN): $(SRCS:%=$(BUILD_DIR)/%.o)
	rm -f $(BIN)
	ar65 r $(BIN) $^

$(BUILD_DIR)/%.s.o : $(SRC_DIR)/%.s
	mkdir -p $(BUILD_DIR)
	ca65 $< -o $@
	
$(BUILD_DIR)/%.c.o : $(SRC_DIR)/%.c
	mkdir -p $(BUILD_DIR)
	cc65 $< -o $@.s -t nes
	ca65 $@.s -o $@
	
